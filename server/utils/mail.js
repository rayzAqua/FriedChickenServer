// Use at least Nodemailer v4.1.0
import nodemailer from "nodemailer";

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "tuanhungtester@gmail.com",
    pass: "vckkyhvzvelxajsq",
  },
});

// Message object

export async function sendMailPromotion(mail, promotions) {
  const listImage = [
    "https://down-vn.img.susercontent.com/file/f6a2e98fd0cc67a650a833c670a9ec9b_tn",
    "https://cf.shopee.vn/file/edd8b67fe6357bb2caae9cd62b3835b9",
  ];
  var contentPromotion;
  promotions.map((promotion) => {
    contentPromotion += `<td align="center" width="270">
    <table style="
        border-collapse: collapse;
      " border="0" width="95%" cellspacing="0" cellpadding="0" align="center">
      <tbody>
        <tr>
          <td style="
              line-height: 0px;
            " align="center">
            <a href="https://v2dc3pjr.r.us-east-1.awstrack.me/L0/https:%2F%2Fgrab.onelink.me%2F2695613898%3Fpid=EDM%26c=VN_NA_PAX_GRW_CONV_LOC__VN_GR_EDM_2021OCT15_Broad%26is_retargeting=true%26af_dp=grab%253A%252F%252Fopen%253FscreenType%253DREWARD%2526rewardID%253D399260%26af_force_deeplink=true%26af_sub5=edm%26af_ad=%26af_web_dp=https%253A%252F%252Fwww.grab.com%252Fvn%252Frewards%252F%26af_ios_url=https%253A%252F%252Fwww.grab.com%252Fvn%252Frewards%252F/1/0100017c871d49f6-38bcf9f2-6fb0-4cec-8c2c-27a0622d66b0-000000/jWMuPBVQo6ItgKpKtjjWOYUWFXA=240" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://v2dc3pjr.r.us-east-1.awstrack.me/L0/https:%252F%252Fgrab.onelink.me%252F2695613898%253Fpid%3DEDM%2526c%3DVN_NA_PAX_GRW_CONV_LOC__VN_GR_EDM_2021OCT15_Broad%2526is_retargeting%3Dtrue%2526af_dp%3Dgrab%25253A%25252F%25252Fopen%25253FscreenType%25253DREWARD%252526rewardID%25253D399260%2526af_force_deeplink%3Dtrue%2526af_sub5%3Dedm%2526af_ad%3D%2526af_web_dp%3Dhttps%25253A%25252F%25252Fwww.grab.com%25252Fvn%25252Frewards%25252F%2526af_ios_url%3Dhttps%25253A%25252F%25252Fwww.grab.com%25252Fvn%25252Frewards%25252F/1/0100017c871d49f6-38bcf9f2-6fb0-4cec-8c2c-27a0622d66b0-000000/jWMuPBVQo6ItgKpKtjjWOYUWFXA%3D240&amp;source=gmail&amp;ust=1686837697656000&amp;usg=AOvVaw0vLtPo04ocozX7pbw8xH2p"><img style="
                  display: block;
                  line-height: 0px;
                  font-size: 0px;
                  border: 0px;
                  height: auto;
                  outline: none;
                  text-decoration: none;
                " src="${
                  listImage[Math.random() * 2]
                }" width="260" height="260" class="CToWUd" data-bit="iit"></a>
          </td>
        </tr>
  
        <tr align="center">
          <td style="
              font-family: 'Open sans',
                Arial,
                sans-serif;
              color: #666666;
              font-size: 14px;
              line-height: 20px;
            ">
            Ưu đãi
            <span style="
                font-weight: 600;
                color: rgb(
                  242,
                  76,
                  61
                );
              ">${promotion.name}</span>
            <br>chỉ với
            <span style="
                font-weight: 600;
                color: #b70404;
              ">${promotion.requirePoint} điểm</span>
          </td>
        </tr>
      </tbody>
    </table>
  </td>`;
  });

  let message = {
    from: "Lotte Promotion <lotte.com>",
    to: mail,
    subject: "ƯU ĐÃI KHUYẾN MÃI NGẬP TRÀN DÀNH CHO KHÁCH HÀNG",

    htmlContent: `<html class="mdl-js">
    <head>
      <style>
        @-webkit-keyframes swal2-show {
          0% {
            -webkit-transform: scale(0.7);
            transform: scale(0.7);
          }
          45% {
            -webkit-transform: scale(1.05);
            transform: scale(1.05);
          }
          80% {
            -webkit-transform: scale(0.95);
            transform: scale(0.95);
          }
          100% {
            -webkit-transform: scale(1);
            transform: scale(1);
          }
        }
        @keyframes swal2-show {
          0% {
            -webkit-transform: scale(0.7);
            transform: scale(0.7);
          }
          45% {
            -webkit-transform: scale(1.05);
            transform: scale(1.05);
          }
          80% {
            -webkit-transform: scale(0.95);
            transform: scale(0.95);
          }
          100% {
            -webkit-transform: scale(1);
            transform: scale(1);
          }
        }
        @-webkit-keyframes swal2-hide {
          0% {
            -webkit-transform: scale(1);
            transform: scale(1);
            opacity: 1;
          }
          100% {
            -webkit-transform: scale(0.5);
            transform: scale(0.5);
            opacity: 0;
          }
        }
        @keyframes swal2-hide {
          0% {
            -webkit-transform: scale(1);
            transform: scale(1);
            opacity: 1;
          }
          100% {
            -webkit-transform: scale(0.5);
            transform: scale(0.5);
            opacity: 0;
          }
        }
        @-webkit-keyframes swal2-animate-success-line-tip {
          0% {
            top: 1.1875em;
            left: 0.0625em;
            width: 0;
          }
          54% {
            top: 1.0625em;
            left: 0.125em;
            width: 0;
          }
          70% {
            top: 2.1875em;
            left: -0.375em;
            width: 3.125em;
          }
          84% {
            top: 3em;
            left: 1.3125em;
            width: 1.0625em;
          }
          100% {
            top: 2.8125em;
            left: 0.875em;
            width: 1.5625em;
          }
        }
        @keyframes swal2-animate-success-line-tip {
          0% {
            top: 1.1875em;
            left: 0.0625em;
            width: 0;
          }
          54% {
            top: 1.0625em;
            left: 0.125em;
            width: 0;
          }
          70% {
            top: 2.1875em;
            left: -0.375em;
            width: 3.125em;
          }
          84% {
            top: 3em;
            left: 1.3125em;
            width: 1.0625em;
          }
          100% {
            top: 2.8125em;
            left: 0.875em;
            width: 1.5625em;
          }
        }
        @-webkit-keyframes swal2-animate-success-line-long {
          0% {
            top: 3.375em;
            right: 2.875em;
            width: 0;
          }
          65% {
            top: 3.375em;
            right: 2.875em;
            width: 0;
          }
          84% {
            top: 2.1875em;
            right: 0;
            width: 3.4375em;
          }
          100% {
            top: 2.375em;
            right: 0.5em;
            width: 2.9375em;
          }
        }
        @keyframes swal2-animate-success-line-long {
          0% {
            top: 3.375em;
            right: 2.875em;
            width: 0;
          }
          65% {
            top: 3.375em;
            right: 2.875em;
            width: 0;
          }
          84% {
            top: 2.1875em;
            right: 0;
            width: 3.4375em;
          }
          100% {
            top: 2.375em;
            right: 0.5em;
            width: 2.9375em;
          }
        }
        @-webkit-keyframes swal2-rotate-success-circular-line {
          0% {
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
          }
          5% {
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
          }
          12% {
            -webkit-transform: rotate(-405deg);
            transform: rotate(-405deg);
          }
          100% {
            -webkit-transform: rotate(-405deg);
            transform: rotate(-405deg);
          }
        }
        @keyframes swal2-rotate-success-circular-line {
          0% {
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
          }
          5% {
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
          }
          12% {
            -webkit-transform: rotate(-405deg);
            transform: rotate(-405deg);
          }
          100% {
            -webkit-transform: rotate(-405deg);
            transform: rotate(-405deg);
          }
        }
        @-webkit-keyframes swal2-animate-error-x-mark {
          0% {
            margin-top: 1.625em;
            -webkit-transform: scale(0.4);
            transform: scale(0.4);
            opacity: 0;
          }
          50% {
            margin-top: 1.625em;
            -webkit-transform: scale(0.4);
            transform: scale(0.4);
            opacity: 0;
          }
          80% {
            margin-top: -0.375em;
            -webkit-transform: scale(1.15);
            transform: scale(1.15);
          }
          100% {
            margin-top: 0;
            -webkit-transform: scale(1);
            transform: scale(1);
            opacity: 1;
          }
        }
        @keyframes swal2-animate-error-x-mark {
          0% {
            margin-top: 1.625em;
            -webkit-transform: scale(0.4);
            transform: scale(0.4);
            opacity: 0;
          }
          50% {
            margin-top: 1.625em;
            -webkit-transform: scale(0.4);
            transform: scale(0.4);
            opacity: 0;
          }
          80% {
            margin-top: -0.375em;
            -webkit-transform: scale(1.15);
            transform: scale(1.15);
          }
          100% {
            margin-top: 0;
            -webkit-transform: scale(1);
            transform: scale(1);
            opacity: 1;
          }
        }
        @-webkit-keyframes swal2-animate-error-icon {
          0% {
            -webkit-transform: rotateX(100deg);
            transform: rotateX(100deg);
            opacity: 0;
          }
          100% {
            -webkit-transform: rotateX(0);
            transform: rotateX(0);
            opacity: 1;
          }
        }
        @keyframes swal2-animate-error-icon {
          0% {
            -webkit-transform: rotateX(100deg);
            transform: rotateX(100deg);
            opacity: 0;
          }
          100% {
            -webkit-transform: rotateX(0);
            transform: rotateX(0);
            opacity: 1;
          }
        }
        body.swal2-toast-shown .swal2-container {
          background-color: transparent;
        }
        body.swal2-toast-shown .swal2-container.swal2-shown {
          background-color: transparent;
        }
        body.swal2-toast-shown .swal2-container.swal2-top {
          top: 0;
          right: auto;
          bottom: auto;
          left: 50%;
          -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
        }
        body.swal2-toast-shown .swal2-container.swal2-top-end,
        body.swal2-toast-shown .swal2-container.swal2-top-right {
          top: 0;
          right: 0;
          bottom: auto;
          left: auto;
        }
        body.swal2-toast-shown .swal2-container.swal2-top-left,
        body.swal2-toast-shown .swal2-container.swal2-top-start {
          top: 0;
          right: auto;
          bottom: auto;
          left: 0;
        }
        body.swal2-toast-shown .swal2-container.swal2-center-left,
        body.swal2-toast-shown .swal2-container.swal2-center-start {
          top: 50%;
          right: auto;
          bottom: auto;
          left: 0;
          -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
        }
        body.swal2-toast-shown .swal2-container.swal2-center {
          top: 50%;
          right: auto;
          bottom: auto;
          left: 50%;
          -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        body.swal2-toast-shown .swal2-container.swal2-center-end,
        body.swal2-toast-shown .swal2-container.swal2-center-right {
          top: 50%;
          right: 0;
          bottom: auto;
          left: auto;
          -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
        }
        body.swal2-toast-shown .swal2-container.swal2-bottom-left,
        body.swal2-toast-shown .swal2-container.swal2-bottom-start {
          top: auto;
          right: auto;
          bottom: 0;
          left: 0;
        }
        body.swal2-toast-shown .swal2-container.swal2-bottom {
          top: auto;
          right: auto;
          bottom: 0;
          left: 50%;
          -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
        }
        body.swal2-toast-shown .swal2-container.swal2-bottom-end,
        body.swal2-toast-shown .swal2-container.swal2-bottom-right {
          top: auto;
          right: 0;
          bottom: 0;
          left: auto;
        }
        body.swal2-toast-column .swal2-toast {
          flex-direction: column;
          align-items: stretch;
        }
        body.swal2-toast-column .swal2-toast .swal2-actions {
          flex: 1;
          align-self: stretch;
          height: 2.2em;
          margin-top: 0.3125em;
        }
        body.swal2-toast-column .swal2-toast .swal2-loading {
          justify-content: center;
        }
        body.swal2-toast-column .swal2-toast .swal2-input {
          height: 2em;
          margin: 0.3125em auto;
          font-size: 1em;
        }
        body.swal2-toast-column .swal2-toast .swal2-validation-message {
          font-size: 1em;
        }
        .swal2-popup.swal2-toast {
          flex-direction: row;
          align-items: center;
          width: auto;
          padding: 0.625em;
          box-shadow: 0 0 0.625em #d9d9d9;
          overflow-y: hidden;
        }
        .swal2-popup.swal2-toast .swal2-header {
          flex-direction: row;
        }
        .swal2-popup.swal2-toast .swal2-title {
          flex-grow: 1;
          justify-content: flex-start;
          margin: 0 0.6em;
          font-size: 1em;
        }
        .swal2-popup.swal2-toast .swal2-footer {
          margin: 0.5em 0 0;
          padding: 0.5em 0 0;
          font-size: 0.8em;
        }
        .swal2-popup.swal2-toast .swal2-close {
          position: initial;
          width: 0.8em;
          height: 0.8em;
          line-height: 0.8;
        }
        .swal2-popup.swal2-toast .swal2-content {
          justify-content: flex-start;
          font-size: 1em;
        }
        .swal2-popup.swal2-toast .swal2-icon {
          width: 2em;
          min-width: 2em;
          height: 2em;
          margin: 0;
        }
        .swal2-popup.swal2-toast .swal2-icon-text {
          font-size: 2em;
          font-weight: 700;
          line-height: 1em;
        }
        .swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring {
          width: 2em;
          height: 2em;
        }
        .swal2-popup.swal2-toast
          .swal2-icon.swal2-error
          [class^="swal2-x-mark-line"] {
          top: 0.875em;
          width: 1.375em;
        }
        .swal2-popup.swal2-toast
          .swal2-icon.swal2-error
          [class^="swal2-x-mark-line"][class$="left"] {
          left: 0.3125em;
        }
        .swal2-popup.swal2-toast
          .swal2-icon.swal2-error
          [class^="swal2-x-mark-line"][class$="right"] {
          right: 0.3125em;
        }
        .swal2-popup.swal2-toast .swal2-actions {
          height: auto;
          margin: 0 0.3125em;
        }
        .swal2-popup.swal2-toast .swal2-styled {
          margin: 0 0.3125em;
          padding: 0.3125em 0.625em;
          font-size: 1em;
        }
        .swal2-popup.swal2-toast .swal2-styled:focus {
          box-shadow: 0 0 0 0.0625em #fff, 0 0 0 0.125em rgba(50, 100, 150, 0.4);
        }
        .swal2-popup.swal2-toast .swal2-success {
          border-color: #a5dc86;
        }
        .swal2-popup.swal2-toast
          .swal2-success
          [class^="swal2-success-circular-line"] {
          position: absolute;
          width: 2em;
          height: 2.8125em;
          -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
          border-radius: 50%;
        }
        .swal2-popup.swal2-toast
          .swal2-success
          [class^="swal2-success-circular-line"][class$="left"] {
          top: -0.25em;
          left: -0.9375em;
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
          -webkit-transform-origin: 2em 2em;
          transform-origin: 2em 2em;
          border-radius: 4em 0 0 4em;
        }
        .swal2-popup.swal2-toast
          .swal2-success
          [class^="swal2-success-circular-line"][class$="right"] {
          top: -0.25em;
          left: 0.9375em;
          -webkit-transform-origin: 0 2em;
          transform-origin: 0 2em;
          border-radius: 0 4em 4em 0;
        }
        .swal2-popup.swal2-toast .swal2-success .swal2-success-ring {
          width: 2em;
          height: 2em;
        }
        .swal2-popup.swal2-toast .swal2-success .swal2-success-fix {
          top: 0;
          left: 0.4375em;
          width: 0.4375em;
          height: 2.6875em;
        }
        .swal2-popup.swal2-toast .swal2-success [class^="swal2-success-line"] {
          height: 0.3125em;
        }
        .swal2-popup.swal2-toast
          .swal2-success
          [class^="swal2-success-line"][class$="tip"] {
          top: 1.125em;
          left: 0.1875em;
          width: 0.75em;
        }
        .swal2-popup.swal2-toast
          .swal2-success
          [class^="swal2-success-line"][class$="long"] {
          top: 0.9375em;
          right: 0.1875em;
          width: 1.375em;
        }
        .swal2-popup.swal2-toast.swal2-show {
          -webkit-animation: showSweetToast 0.5s;
          animation: showSweetToast 0.5s;
        }
        .swal2-popup.swal2-toast.swal2-hide {
          -webkit-animation: hideSweetToast 0.2s forwards;
          animation: hideSweetToast 0.2s forwards;
        }
        .swal2-popup.swal2-toast
          .swal2-animate-success-icon
          .swal2-success-line-tip {
          -webkit-animation: animate-toast-success-tip 0.75s;
          animation: animate-toast-success-tip 0.75s;
        }
        .swal2-popup.swal2-toast
          .swal2-animate-success-icon
          .swal2-success-line-long {
          -webkit-animation: animate-toast-success-long 0.75s;
          animation: animate-toast-success-long 0.75s;
        }
        @-webkit-keyframes showSweetToast {
          0% {
            -webkit-transform: translateY(-0.625em) rotateZ(2deg);
            transform: translateY(-0.625em) rotateZ(2deg);
            opacity: 0;
          }
          33% {
            -webkit-transform: translateY(0) rotateZ(-2deg);
            transform: translateY(0) rotateZ(-2deg);
            opacity: 0.5;
          }
          66% {
            -webkit-transform: translateY(0.3125em) rotateZ(2deg);
            transform: translateY(0.3125em) rotateZ(2deg);
            opacity: 0.7;
          }
          100% {
            -webkit-transform: translateY(0) rotateZ(0);
            transform: translateY(0) rotateZ(0);
            opacity: 1;
          }
        }
        @keyframes showSweetToast {
          0% {
            -webkit-transform: translateY(-0.625em) rotateZ(2deg);
            transform: translateY(-0.625em) rotateZ(2deg);
            opacity: 0;
          }
          33% {
            -webkit-transform: translateY(0) rotateZ(-2deg);
            transform: translateY(0) rotateZ(-2deg);
            opacity: 0.5;
          }
          66% {
            -webkit-transform: translateY(0.3125em) rotateZ(2deg);
            transform: translateY(0.3125em) rotateZ(2deg);
            opacity: 0.7;
          }
          100% {
            -webkit-transform: translateY(0) rotateZ(0);
            transform: translateY(0) rotateZ(0);
            opacity: 1;
          }
        }
        @-webkit-keyframes hideSweetToast {
          0% {
            opacity: 1;
          }
          33% {
            opacity: 0.5;
          }
          100% {
            -webkit-transform: rotateZ(1deg);
            transform: rotateZ(1deg);
            opacity: 0;
          }
        }
        @keyframes hideSweetToast {
          0% {
            opacity: 1;
          }
          33% {
            opacity: 0.5;
          }
          100% {
            -webkit-transform: rotateZ(1deg);
            transform: rotateZ(1deg);
            opacity: 0;
          }
        }
        @-webkit-keyframes animate-toast-success-tip {
          0% {
            top: 0.5625em;
            left: 0.0625em;
            width: 0;
          }
          54% {
            top: 0.125em;
            left: 0.125em;
            width: 0;
          }
          70% {
            top: 0.625em;
            left: -0.25em;
            width: 1.625em;
          }
          84% {
            top: 1.0625em;
            left: 0.75em;
            width: 0.5em;
          }
          100% {
            top: 1.125em;
            left: 0.1875em;
            width: 0.75em;
          }
        }
        @keyframes animate-toast-success-tip {
          0% {
            top: 0.5625em;
            left: 0.0625em;
            width: 0;
          }
          54% {
            top: 0.125em;
            left: 0.125em;
            width: 0;
          }
          70% {
            top: 0.625em;
            left: -0.25em;
            width: 1.625em;
          }
          84% {
            top: 1.0625em;
            left: 0.75em;
            width: 0.5em;
          }
          100% {
            top: 1.125em;
            left: 0.1875em;
            width: 0.75em;
          }
        }
        @-webkit-keyframes animate-toast-success-long {
          0% {
            top: 1.625em;
            right: 1.375em;
            width: 0;
          }
          65% {
            top: 1.25em;
            right: 0.9375em;
            width: 0;
          }
          84% {
            top: 0.9375em;
            right: 0;
            width: 1.125em;
          }
          100% {
            top: 0.9375em;
            right: 0.1875em;
            width: 1.375em;
          }
        }
        @keyframes animate-toast-success-long {
          0% {
            top: 1.625em;
            right: 1.375em;
            width: 0;
          }
          65% {
            top: 1.25em;
            right: 0.9375em;
            width: 0;
          }
          84% {
            top: 0.9375em;
            right: 0;
            width: 1.125em;
          }
          100% {
            top: 0.9375em;
            right: 0.1875em;
            width: 1.375em;
          }
        }
        body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) {
          overflow: hidden;
        }
        body.swal2-height-auto {
          height: auto !important;
        }
        body.swal2-no-backdrop .swal2-shown {
          top: auto;
          right: auto;
          bottom: auto;
          left: auto;
          background-color: transparent;
        }
        body.swal2-no-backdrop .swal2-shown > .swal2-modal {
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        }
        body.swal2-no-backdrop .swal2-shown.swal2-top {
          top: 0;
          left: 50%;
          -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
        }
        body.swal2-no-backdrop .swal2-shown.swal2-top-left,
        body.swal2-no-backdrop .swal2-shown.swal2-top-start {
          top: 0;
          left: 0;
        }
        body.swal2-no-backdrop .swal2-shown.swal2-top-end,
        body.swal2-no-backdrop .swal2-shown.swal2-top-right {
          top: 0;
          right: 0;
        }
        body.swal2-no-backdrop .swal2-shown.swal2-center {
          top: 50%;
          left: 50%;
          -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        body.swal2-no-backdrop .swal2-shown.swal2-center-left,
        body.swal2-no-backdrop .swal2-shown.swal2-center-start {
          top: 50%;
          left: 0;
          -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
        }
        body.swal2-no-backdrop .swal2-shown.swal2-center-end,
        body.swal2-no-backdrop .swal2-shown.swal2-center-right {
          top: 50%;
          right: 0;
          -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
        }
        body.swal2-no-backdrop .swal2-shown.swal2-bottom {
          bottom: 0;
          left: 50%;
          -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
        }
        body.swal2-no-backdrop .swal2-shown.swal2-bottom-left,
        body.swal2-no-backdrop .swal2-shown.swal2-bottom-start {
          bottom: 0;
          left: 0;
        }
        body.swal2-no-backdrop .swal2-shown.swal2-bottom-end,
        body.swal2-no-backdrop .swal2-shown.swal2-bottom-right {
          right: 0;
          bottom: 0;
        }
        .swal2-container {
          display: flex;
          position: fixed;
          top: 0;
          right: 0;
          bottom: 0;
          left: 0;
          flex-direction: row;
          align-items: center;
          justify-content: center;
          padding: 10px;
          background-color: transparent;
          z-index: 1060;
          overflow-x: hidden;
          -webkit-overflow-scrolling: touch;
        }
        .swal2-container.swal2-top {
          align-items: flex-start;
        }
        .swal2-container.swal2-top-left,
        .swal2-container.swal2-top-start {
          align-items: flex-start;
          justify-content: flex-start;
        }
        .swal2-container.swal2-top-end,
        .swal2-container.swal2-top-right {
          align-items: flex-start;
          justify-content: flex-end;
        }
        .swal2-container.swal2-center {
          align-items: center;
        }
        .swal2-container.swal2-center-left,
        .swal2-container.swal2-center-start {
          align-items: center;
          justify-content: flex-start;
        }
        .swal2-container.swal2-center-end,
        .swal2-container.swal2-center-right {
          align-items: center;
          justify-content: flex-end;
        }
        .swal2-container.swal2-bottom {
          align-items: flex-end;
        }
        .swal2-container.swal2-bottom-left,
        .swal2-container.swal2-bottom-start {
          align-items: flex-end;
          justify-content: flex-start;
        }
        .swal2-container.swal2-bottom-end,
        .swal2-container.swal2-bottom-right {
          align-items: flex-end;
          justify-content: flex-end;
        }
        .swal2-container.swal2-grow-fullscreen > .swal2-modal {
          display: flex !important;
          flex: 1;
          align-self: stretch;
          justify-content: center;
        }
        .swal2-container.swal2-grow-row > .swal2-modal {
          display: flex !important;
          flex: 1;
          align-content: center;
          justify-content: center;
        }
        .swal2-container.swal2-grow-column {
          flex: 1;
          flex-direction: column;
        }
        .swal2-container.swal2-grow-column.swal2-bottom,
        .swal2-container.swal2-grow-column.swal2-center,
        .swal2-container.swal2-grow-column.swal2-top {
          align-items: center;
        }
        .swal2-container.swal2-grow-column.swal2-bottom-left,
        .swal2-container.swal2-grow-column.swal2-bottom-start,
        .swal2-container.swal2-grow-column.swal2-center-left,
        .swal2-container.swal2-grow-column.swal2-center-start,
        .swal2-container.swal2-grow-column.swal2-top-left,
        .swal2-container.swal2-grow-column.swal2-top-start {
          align-items: flex-start;
        }
        .swal2-container.swal2-grow-column.swal2-bottom-end,
        .swal2-container.swal2-grow-column.swal2-bottom-right,
        .swal2-container.swal2-grow-column.swal2-center-end,
        .swal2-container.swal2-grow-column.swal2-center-right,
        .swal2-container.swal2-grow-column.swal2-top-end,
        .swal2-container.swal2-grow-column.swal2-top-right {
          align-items: flex-end;
        }
        .swal2-container.swal2-grow-column > .swal2-modal {
          display: flex !important;
          flex: 1;
          align-content: center;
          justify-content: center;
        }
        .swal2-container:not(.swal2-top):not(.swal2-top-start):not(
            .swal2-top-end
          ):not(.swal2-top-left):not(.swal2-top-right):not(
            .swal2-center-start
          ):not(.swal2-center-end):not(.swal2-center-left):not(
            .swal2-center-right
          ):not(.swal2-bottom):not(.swal2-bottom-start):not(
            .swal2-bottom-end
          ):not(.swal2-bottom-left):not(.swal2-bottom-right):not(
            .swal2-grow-fullscreen
          )
          > .swal2-modal {
          margin: auto;
        }
        @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
          .swal2-container .swal2-modal {
            margin: 0 !important;
          }
        }
        .swal2-container.swal2-fade {
          transition: background-color 0.1s;
        }
        .swal2-container.swal2-shown {
          background-color: rgba(0, 0, 0, 0.4);
        }
        .swal2-popup {
          display: none;
          position: relative;
          flex-direction: column;
          justify-content: center;
          width: 32em;
          max-width: 100%;
          padding: 1.25em;
          border-radius: 0.3125em;
          background: #fff;
          font-family: inherit;
          font-size: 1rem;
          box-sizing: border-box;
        }
        .swal2-popup:focus {
          outline: 0;
        }
        .swal2-popup.swal2-loading {
          overflow-y: hidden;
        }
        .swal2-popup .swal2-header {
          display: flex;
          flex-direction: column;
          align-items: center;
        }
        .swal2-popup .swal2-title {
          display: block;
          position: relative;
          max-width: 100%;
          margin: 0 0 0.4em;
          padding: 0;
          color: #595959;
          font-size: 1.875em;
          font-weight: 600;
          text-align: center;
          text-transform: none;
          word-wrap: break-word;
        }
        .swal2-popup .swal2-actions {
          flex-wrap: wrap;
          align-items: center;
          justify-content: center;
          margin: 1.25em auto 0;
          z-index: 1;
        }
        .swal2-popup .swal2-actions:not(.swal2-loading) .swal2-styled[disabled] {
          opacity: 0.4;
        }
        .swal2-popup .swal2-actions:not(.swal2-loading) .swal2-styled:hover {
          background-image: linear-gradient(
            rgba(0, 0, 0, 0.1),
            rgba(0, 0, 0, 0.1)
          );
        }
        .swal2-popup .swal2-actions:not(.swal2-loading) .swal2-styled:active {
          background-image: linear-gradient(
            rgba(0, 0, 0, 0.2),
            rgba(0, 0, 0, 0.2)
          );
        }
        .swal2-popup .swal2-actions.swal2-loading .swal2-styled.swal2-confirm {
          width: 2.5em;
          height: 2.5em;
          margin: 0.46875em;
          padding: 0;
          border: 0.25em solid transparent;
          border-radius: 100%;
          border-color: transparent;
          background-color: transparent !important;
          color: transparent;
          cursor: default;
          box-sizing: border-box;
          -webkit-animation: swal2-rotate-loading 1.5s linear 0s infinite normal;
          animation: swal2-rotate-loading 1.5s linear 0s infinite normal;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
        }
        .swal2-popup .swal2-actions.swal2-loading .swal2-styled.swal2-cancel {
          margin-right: 30px;
          margin-left: 30px;
        }
        .swal2-popup
          .swal2-actions.swal2-loading
          :not(.swal2-styled).swal2-confirm::after {
          display: inline-block;
          width: 15px;
          height: 15px;
          margin-left: 5px;
          border: 3px solid #999;
          border-radius: 50%;
          border-right-color: transparent;
          box-shadow: 1px 1px 1px #fff;
          content: "";
          -webkit-animation: swal2-rotate-loading 1.5s linear 0s infinite normal;
          animation: swal2-rotate-loading 1.5s linear 0s infinite normal;
        }
        .swal2-popup .swal2-styled {
          margin: 0.3125em;
          padding: 0.625em 2em;
          font-weight: 500;
          box-shadow: none;
        }
        .swal2-popup .swal2-styled:not([disabled]) {
          cursor: pointer;
        }
        .swal2-popup .swal2-styled.swal2-confirm {
          border: 0;
          border-radius: 0.25em;
          background: initial;
          background-color: #3085d6;
          color: #fff;
          font-size: 1.0625em;
        }
        .swal2-popup .swal2-styled.swal2-cancel {
          border: 0;
          border-radius: 0.25em;
          background: initial;
          background-color: #aaa;
          color: #fff;
          font-size: 1.0625em;
        }
        .swal2-popup .swal2-styled:focus {
          outline: 0;
          box-shadow: 0 0 0 2px #fff, 0 0 0 4px rgba(50, 100, 150, 0.4);
        }
        .swal2-popup .swal2-styled::-moz-focus-inner {
          border: 0;
        }
        .swal2-popup .swal2-footer {
          justify-content: center;
          margin: 1.25em 0 0;
          padding: 1em 0 0;
          border-top: 1px solid #eee;
          color: #545454;
          font-size: 1em;
        }
        .swal2-popup .swal2-image {
          max-width: 100%;
          margin: 1.25em auto;
        }
        .swal2-popup .swal2-close {
          position: absolute;
          top: 0;
          right: 0;
          justify-content: center;
          width: 1.2em;
          height: 1.2em;
          padding: 0;
          transition: color 0.1s ease-out;
          border: none;
          border-radius: 0;
          outline: initial;
          background: 0 0;
          color: #ccc;
          font-family: serif;
          font-size: 2.5em;
          line-height: 1.2;
          cursor: pointer;
          overflow: hidden;
        }
        .swal2-popup .swal2-close:hover {
          -webkit-transform: none;
          transform: none;
          color: #f27474;
        }
        .swal2-popup > .swal2-checkbox,
        .swal2-popup > .swal2-file,
        .swal2-popup > .swal2-input,
        .swal2-popup > .swal2-radio,
        .swal2-popup > .swal2-select,
        .swal2-popup > .swal2-textarea {
          display: none;
        }
        .swal2-popup .swal2-content {
          justify-content: center;
          margin: 0;
          padding: 0;
          color: #545454;
          font-size: 1.125em;
          font-weight: 300;
          line-height: normal;
          z-index: 1;
          word-wrap: break-word;
        }
        .swal2-popup #swal2-content {
          text-align: center;
        }
        .swal2-popup .swal2-checkbox,
        .swal2-popup .swal2-file,
        .swal2-popup .swal2-input,
        .swal2-popup .swal2-radio,
        .swal2-popup .swal2-select,
        .swal2-popup .swal2-textarea {
          margin: 1em auto;
        }
        .swal2-popup .swal2-file,
        .swal2-popup .swal2-input,
        .swal2-popup .swal2-textarea {
          width: 100%;
          transition: border-color 0.3s, box-shadow 0.3s;
          border: 1px solid #d9d9d9;
          border-radius: 0.1875em;
          font-size: 1.125em;
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.06);
          box-sizing: border-box;
        }
        .swal2-popup .swal2-file.swal2-inputerror,
        .swal2-popup .swal2-input.swal2-inputerror,
        .swal2-popup .swal2-textarea.swal2-inputerror {
          border-color: #f27474 !important;
          box-shadow: 0 0 2px #f27474 !important;
        }
        .swal2-popup .swal2-file:focus,
        .swal2-popup .swal2-input:focus,
        .swal2-popup .swal2-textarea:focus {
          border: 1px solid #b4dbed;
          outline: 0;
          box-shadow: 0 0 3px #c4e6f5;
        }
        .swal2-popup .swal2-file::-webkit-input-placeholder,
        .swal2-popup .swal2-input::-webkit-input-placeholder,
        .swal2-popup .swal2-textarea::-webkit-input-placeholder {
          color: #ccc;
        }
        .swal2-popup .swal2-file:-ms-input-placeholder,
        .swal2-popup .swal2-input:-ms-input-placeholder,
        .swal2-popup .swal2-textarea:-ms-input-placeholder {
          color: #ccc;
        }
        .swal2-popup .swal2-file::-ms-input-placeholder,
        .swal2-popup .swal2-input::-ms-input-placeholder,
        .swal2-popup .swal2-textarea::-ms-input-placeholder {
          color: #ccc;
        }
        .swal2-popup .swal2-file::placeholder,
        .swal2-popup .swal2-input::placeholder,
        .swal2-popup .swal2-textarea::placeholder {
          color: #ccc;
        }
        .swal2-popup .swal2-range input {
          width: 80%;
        }
        .swal2-popup .swal2-range output {
          width: 20%;
          font-weight: 600;
          text-align: center;
        }
        .swal2-popup .swal2-range input,
        .swal2-popup .swal2-range output {
          height: 2.625em;
          margin: 1em auto;
          padding: 0;
          font-size: 1.125em;
          line-height: 2.625em;
        }
        .swal2-popup .swal2-input {
          height: 2.625em;
          padding: 0 0.75em;
        }
        .swal2-popup .swal2-input[type="number"] {
          max-width: 10em;
        }
        .swal2-popup .swal2-file {
          font-size: 1.125em;
        }
        .swal2-popup .swal2-textarea {
          height: 6.75em;
          padding: 0.75em;
        }
        .swal2-popup .swal2-select {
          min-width: 50%;
          max-width: 100%;
          padding: 0.375em 0.625em;
          color: #545454;
          font-size: 1.125em;
        }
        .swal2-popup .swal2-checkbox,
        .swal2-popup .swal2-radio {
          align-items: center;
          justify-content: center;
        }
        .swal2-popup .swal2-checkbox label,
        .swal2-popup .swal2-radio label {
          margin: 0 0.6em;
          font-size: 1.125em;
        }
        .swal2-popup .swal2-checkbox input,
        .swal2-popup .swal2-radio input {
          margin: 0 0.4em;
        }
        .swal2-popup .swal2-validation-message {
          display: none;
          align-items: center;
          justify-content: center;
          padding: 0.625em;
          background: #f0f0f0;
          color: #666;
          font-size: 1em;
          font-weight: 300;
          overflow: hidden;
        }
        .swal2-popup .swal2-validation-message::before {
          display: inline-block;
          width: 1.5em;
          min-width: 1.5em;
          height: 1.5em;
          margin: 0 0.625em;
          border-radius: 50%;
          background-color: #f27474;
          color: #fff;
          font-weight: 600;
          line-height: 1.5em;
          text-align: center;
          content: "!";
          zoom: normal;
        }
        @supports (-ms-accelerator: true) {
          .swal2-range input {
            width: 100% !important;
          }
          .swal2-range output {
            display: none;
          }
        }
        @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
          .swal2-range input {
            width: 100% !important;
          }
          .swal2-range output {
            display: none;
          }
        }
        @-moz-document url-prefix() {
          .swal2-close:focus {
            outline: 2px solid rgba(50, 100, 150, 0.4);
          }
        }
        .swal2-icon {
          position: relative;
          justify-content: center;
          width: 5em;
          height: 5em;
          margin: 1.25em auto 1.875em;
          border: 0.25em solid transparent;
          border-radius: 50%;
          line-height: 5em;
          cursor: default;
          box-sizing: content-box;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
          zoom: normal;
        }
        .swal2-icon-text {
          font-size: 3.75em;
        }
        .swal2-icon.swal2-error {
          border-color: #f27474;
        }
        .swal2-icon.swal2-error .swal2-x-mark {
          position: relative;
          flex-grow: 1;
        }
        .swal2-icon.swal2-error [class^="swal2-x-mark-line"] {
          display: block;
          position: absolute;
          top: 2.3125em;
          width: 2.9375em;
          height: 0.3125em;
          border-radius: 0.125em;
          background-color: #f27474;
        }
        .swal2-icon.swal2-error [class^="swal2-x-mark-line"][class$="left"] {
          left: 1.0625em;
          -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
        }
        .swal2-icon.swal2-error [class^="swal2-x-mark-line"][class$="right"] {
          right: 1em;
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
        }
        .swal2-icon.swal2-warning {
          border-color: #facea8;
          color: #f8bb86;
        }
        .swal2-icon.swal2-info {
          border-color: #9de0f6;
          color: #3fc3ee;
        }
        .swal2-icon.swal2-question {
          border-color: #c9dae1;
          color: #87adbd;
        }
        .swal2-icon.swal2-success {
          border-color: #a5dc86;
        }
        .swal2-icon.swal2-success [class^="swal2-success-circular-line"] {
          position: absolute;
          width: 3.75em;
          height: 7.5em;
          -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
          border-radius: 50%;
        }
        .swal2-icon.swal2-success
          [class^="swal2-success-circular-line"][class$="left"] {
          top: -0.4375em;
          left: -2.0635em;
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
          -webkit-transform-origin: 3.75em 3.75em;
          transform-origin: 3.75em 3.75em;
          border-radius: 7.5em 0 0 7.5em;
        }
        .swal2-icon.swal2-success
          [class^="swal2-success-circular-line"][class$="right"] {
          top: -0.6875em;
          left: 1.875em;
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
          -webkit-transform-origin: 0 3.75em;
          transform-origin: 0 3.75em;
          border-radius: 0 7.5em 7.5em 0;
        }
        .swal2-icon.swal2-success .swal2-success-ring {
          position: absolute;
          top: -0.25em;
          left: -0.25em;
          width: 100%;
          height: 100%;
          border: 0.25em solid rgba(165, 220, 134, 0.3);
          border-radius: 50%;
          z-index: 2;
          box-sizing: content-box;
        }
        .swal2-icon.swal2-success .swal2-success-fix {
          position: absolute;
          top: 0.5em;
          left: 1.625em;
          width: 0.4375em;
          height: 5.625em;
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
          z-index: 1;
        }
        .swal2-icon.swal2-success [class^="swal2-success-line"] {
          display: block;
          position: absolute;
          height: 0.3125em;
          border-radius: 0.125em;
          background-color: #a5dc86;
          z-index: 2;
        }
        .swal2-icon.swal2-success [class^="swal2-success-line"][class$="tip"] {
          top: 2.875em;
          left: 0.875em;
          width: 1.5625em;
          -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
        }
        .swal2-icon.swal2-success [class^="swal2-success-line"][class$="long"] {
          top: 2.375em;
          right: 0.5em;
          width: 2.9375em;
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
        }
        .swal2-progresssteps {
          align-items: center;
          margin: 0 0 1.25em;
          padding: 0;
          font-weight: 600;
        }
        .swal2-progresssteps li {
          display: inline-block;
          position: relative;
        }
        .swal2-progresssteps .swal2-progresscircle {
          width: 2em;
          height: 2em;
          border-radius: 2em;
          background: #3085d6;
          color: #fff;
          line-height: 2em;
          text-align: center;
          z-index: 20;
        }
        .swal2-progresssteps .swal2-progresscircle:first-child {
          margin-left: 0;
        }
        .swal2-progresssteps .swal2-progresscircle:last-child {
          margin-right: 0;
        }
        .swal2-progresssteps .swal2-progresscircle.swal2-activeprogressstep {
          background: #3085d6;
        }
        .swal2-progresssteps
          .swal2-progresscircle.swal2-activeprogressstep
          ~ .swal2-progresscircle {
          background: #add8e6;
        }
        .swal2-progresssteps
          .swal2-progresscircle.swal2-activeprogressstep
          ~ .swal2-progressline {
          background: #add8e6;
        }
        .swal2-progresssteps .swal2-progressline {
          width: 2.5em;
          height: 0.4em;
          margin: 0 -1px;
          background: #3085d6;
          z-index: 10;
        }
        [class^="swal2"] {
          -webkit-tap-highlight-color: transparent;
        }
        .swal2-show {
          -webkit-animation: swal2-show 0.3s;
          animation: swal2-show 0.3s;
        }
        .swal2-show.swal2-noanimation {
          -webkit-animation: none;
          animation: none;
        }
        .swal2-hide {
          -webkit-animation: swal2-hide 0.15s forwards;
          animation: swal2-hide 0.15s forwards;
        }
        .swal2-hide.swal2-noanimation {
          -webkit-animation: none;
          animation: none;
        }
        .swal2-rtl .swal2-close {
          right: auto;
          left: 0;
        }
        .swal2-animate-success-icon .swal2-success-line-tip {
          -webkit-animation: swal2-animate-success-line-tip 0.75s;
          animation: swal2-animate-success-line-tip 0.75s;
        }
        .swal2-animate-success-icon .swal2-success-line-long {
          -webkit-animation: swal2-animate-success-line-long 0.75s;
          animation: swal2-animate-success-line-long 0.75s;
        }
        .swal2-animate-success-icon .swal2-success-circular-line-right {
          -webkit-animation: swal2-rotate-success-circular-line 4.25s ease-in;
          animation: swal2-rotate-success-circular-line 4.25s ease-in;
        }
        .swal2-animate-error-icon {
          -webkit-animation: swal2-animate-error-icon 0.5s;
          animation: swal2-animate-error-icon 0.5s;
        }
        .swal2-animate-error-icon .swal2-x-mark {
          -webkit-animation: swal2-animate-error-x-mark 0.5s;
          animation: swal2-animate-error-x-mark 0.5s;
        }
        @-webkit-keyframes swal2-rotate-loading {
          0% {
            -webkit-transform: rotate(0);
            transform: rotate(0);
          }
          100% {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
          }
        }
        @keyframes swal2-rotate-loading {
          0% {
            -webkit-transform: rotate(0);
            transform: rotate(0);
          }
          100% {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
          }
        }
        @media print {
          body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) {
            overflow-y: scroll !important;
          }
          body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown)
            > [aria-hidden="true"] {
            display: none;
          }
          body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown)
            .swal2-container {
            position: initial !important;
          }
        }
      </style>
      <style>
        .ejoy-sub-active {
          color: #1296ba !important;
        }
  
        .ejoy-sub-hovered {
          color: #1296ba !important;
        }
        .ejoy-sub-clzz {
          cursor: pointer;
  
          lineheight: 1.2;
          font-size: 28px;
          color: #ffcc00;
          background: rgba(17, 17, 17, 0.7);
        }
        .ejoy-sub-clzz:hover {
          color: #1296ba !important;
        }
        .ej-trans-sub {
          position: absolute;
          width: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
          z-index: 9999999;
          cursor: move;
        }
        .ej-trans-sub > span {
          color: #3cf9ed;
          font-size: 18px;
          text-align: center;
          padding: 0 16px;
          line-height: 1.5;
          background: rgba(32, 26, 25, 0.8);
          // text-shadow: 0px 1px 4px black;
          padding: 0 8px;
  
          lineheight: 1.2;
          font-size: 16px;
          color: #0cb1c7;
          background: rgba(67, 65, 65, 0.7);
        }
        .ej-full-screen-video {
          position: absolute;
          width: 30px;
          height: 30px;
          top: 30px;
          right: 10px;
          display: flex;
          justify-content: center;
          align-items: center;
          z-index: 99999999;
          cursor: pointer;
        }
        .ej-main-sub {
          position: absolute;
          width: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
          z-index: 99999999;
          cursor: move;
          padding: 0 8px;
        }
        .ej-main-sub > span {
          color: white;
          font-size: 20px;
          line-height: 1.5;
          text-align: center;
          background: rgba(32, 26, 25, 0.8);
          padding: 2px 8px;
  
          lineheight: 1.2;
          font-size: 28px;
          color: #ffcc00;
          background: rgba(17, 17, 17, 0.7);
        }
  
        .ej-main-sub .ejoy-sub-clzz {
          background: transparent !important;
        }
  
        .tran-subtitle > span {
          cursor: pointer;
          padding-left: 10px;
          top: 2px;
          position: relative;
        }
  
        .tran-subtitle > span > span {
          position: absolute;
          top: -170%;
          background: rgba(0, 0, 0, 0.5);
          font-size: 13px;
          line-height: 20px;
          padding: 2px 8px;
          color: white;
          display: none;
          border-radius: 4px;
          white-space: nowrap;
          left: -50%;
          font-weight: normal;
        }
  
        .viewPopupPro {
          z-index: 2147483647;
          cursor: auto;
          position: absolute;
          z-index: 2147483647;
          background: #111111;
          transition: opacity 1s;
          width: 172px;
          height: 66px;
          opacity: 1;
          border-radius: 6px;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }
  
        .titlePopupPro {
          font-style: normal;
          font-weight: 400;
          font-size: 10px;
          line-height: 12px;
          color: #e5e5e5;
          text-shadow: 0px 3px 3px rgba(0, 0, 0, 0.25);
        }
  
        .viewGoPro {
          background: #ffcc00;
          border-radius: 72.6257px;
          display: flex;
          justify-content: center;
          align-items: center;
          margin-top: 8px;
          padding-left: 10px;
          cursor: pointer;
        }
  
        .viewGoPro svg {
          pointer-events: none;
        }
  
        .textGoPro {
          font-style: normal;
          font-weight: 600;
          font-size: 10px;
          line-height: 12px;
          pointer-events: none;
          text-align: center;
          color: #ffffff;
          padding: 4px 14px 4px 4px;
        }
  
        .viewPopupPro {
          top: auto !important;
          bottom: 15px !important;
        }
  
        .view-icon-copy-main-sub:hover > span,
        .view-icon-edit-sub:hover > span,
        .view-icon-exit-full-sub:hover > span,
        .view-icon-full-sub:hover > span,
        .iconCrownGoPro:hover > span,
        .view-icon-copy-tran-sub:hover > span {
          display: block;
        }
  
        .iconCrownGoPro {
          padding-left: 0px !important;
          padding-right: 8px !important;
        }
        .iconCrownGoPro svg {
          width: 17px;
          height: 17px;
        }
        .view-icon-full-sub,
        .view-icon-exit-full-sub {
          display: flex;
        }
  
        .view-icon-full-sub > svg,
        .view-icon-exit-full-sub > svg {
          pointer-events: none;
        }
  
        .tran-subtitle > span > svg {
          width: 16px;
          height: 16px;
          pointer-events: none;
          display: inline-flex !important;
          vertical-align: baseline !important;
        }
  
        .view-icon-copy-main-sub > svg {
          pointer-events: none;
          color: #ffcc00;
        }
  
        .iconCrownGoPro {
          padding-left: 0 !important;
          padding-right: 8px !important;
        }
        .view-icon-copy-tran-sub > svg {
          pointer-events: none;
          color: #0cb1c7;
        }
      </style>
    </head>
    <body>
      <div
        style="
          margin: 0px;
          padding: 0px;
          color: rgb(32, 32, 32);
          font-size: 14px;
          font-weight: normal;
          font-family: Helvetica, Arial, sans-serif !important;
          line-height: 150% !important;
        "
      >
        <span class="im">
          <div
            style="
              display: none !important;
              opacity: 0;
              color: transparent;
              height: 0;
              width: 0;
            "
          >
            Your order request has been received
          </div>
        </span>
        <div class="m_4836663727624563565main-content" align="center">
          <table
            border="0"
            cellpadding="0"
            cellspacing="0"
            width="100%"
            style="max-width: 730px"
          >
            <tbody>
              <tr>
                <td colspan="2"></td>
                <td bgcolor="#E8E8E8" colspan="3" height="1px"></td>
                <td colspan="3"></td>
              </tr>
              <tr>
                <td bgcolor="#F8F8F8" width="1px"></td>
                <td bgcolor="#E8E8E8" width="1px"></td>
                <td bgcolor="#D1D1D1" width="1px"></td>
  
                <td bgcolor="#FFF">
                  <span class="im">
                    <div
                      class="m_4836663727624563565header"
                      style="margin-bottom: 15px"
                    >
                      <div>
                        <table
                          class="m_4836663727624563565header"
                          lang="header"
                          cellpadding="0"
                          cellspacing="0"
                          width="100%"
                          border="0"
                          style="width: 100%"
                        >
                          <tbody>
                            <tr>
                              <td
                                width="100%"
                                height="70"
                                valign="top"
                                bgcolor="#FFFFFF"
                                style="
                                  padding-top: 30px;
                                  background: #ffffff;
                                  height: 70px;
                                "
                              >
                                <table
                                  cellpadding="0"
                                  cellspacing="0"
                                  width="100%"
                                  height="70"
                                  border="0"
                                  style="width: 100%; height: 70px"
                                >
                                  <tbody>
                                    <tr>
                                      <td style="width: 20px" width="20">
                                        <div lang="space40"></div>
                                      </td>
                                      <td valign="middle" align="center">
                                        <div
                                          style="
                                            font-size: 5px;
                                            line-height: 5px;
                                            height: 5px;
                                          "
                                        ></div>
                                        <a
                                          href="https://www.lazada.vn"
                                          style="text-decoration: none"
                                          target="_blank"
                                          data-saferedirecturl="https://www.google.com/url?q=https://www.lazada.vn&amp;source=gmail&amp;ust=1686840370820000&amp;usg=AOvVaw30TScvcg4Su3aER_bszs36"
                                          ><img
                                            src="https://www.lotteria.vn/grs-static/images/lotteria_logo.svg"
                                            style="
                                              display: block;
                                              max-width: 209px;
                                              border: none;
                                            "
                                            width="209"
                                            class="CToWUd"
                                            data-bit="iit"
                                          />
                                        </a>
                                        <div
                                          style="
                                            font-size: 5px;
                                            line-height: 5px;
                                            height: 5px;
                                          "
                                        ></div>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td
                                width="100%"
                                height="50"
                                valign="middle"
                                bgcolor="#FFFFFF"
                                style="background: #ffffff; height: 50px"
                              >
                                <table
                                  width="100%"
                                  cellspacing="0"
                                  cellpadding="0"
                                  border="0"
                                >
                                  <tbody>
                                    <tr>
                                      <td align="center" width="150">
                                        <p
                                          style="
                                            font-size: 11pt;
                                            font-weight: bold;
                                            font-family: Arial, Helvetica,
                                              sans-serif;
                                            color: #0f146d;
                                            background-color: #ffffff;
                                          "
                                        >
                                          <a
                                            href="https://www.lazada.vn/shop/bach-hoa-lazada"
                                            style="
                                              text-decoration: none;
                                              font-weight: bold;
                                              color: #b70404 !important;
                                            "
                                            target="_blank"
                                            data-saferedirecturl="https://www.google.com/url?q=https://www.lazada.vn/shop/bach-hoa-lazada&amp;source=gmail&amp;ust=1686840370820000&amp;usg=AOvVaw1v7En54zp9rzI_YftdrF-F"
                                            >Gà rán<br />
                                            Lotte</a
                                          >
                                        </p>
                                      </td>
                                      <td align="center" width="150">
                                        <p
                                          style="
                                            font-size: 11pt;
                                            font-weight: bold;
                                            font-family: Arial, Helvetica,
                                              sans-serif;
                                            color: #0f146d;
                                            background-color: #ffffff;
                                          "
                                        >
                                          <a
                                            href="https://pages.lazada.vn/wow/i/vn/LandingPage/lazmall"
                                            style="
                                              text-decoration: none;
                                              font-weight: bold;
                                              color: #b70404 !important;
                                            "
                                            target="_blank"
                                            data-saferedirecturl="https://www.google.com/url?q=https://pages.lazada.vn/wow/i/vn/LandingPage/lazmall&amp;source=gmail&amp;ust=1686840370820000&amp;usg=AOvVaw3jwX2K7EMAHgBjnPNRPG-r"
                                            >Ăn uống</a
                                          >
                                        </p>
                                      </td>
                                      <td align="center" width="150">
                                        <p
                                          style="
                                            font-size: 11pt;
                                            font-weight: bold;
                                            font-family: Arial, Helvetica,
                                              sans-serif;
                                            color: #0f146d;
                                            background-color: #ffffff;
                                          "
                                        >
                                          <a
                                            href="https://www.lazada.vn/voucher"
                                            style="
                                              text-decoration: none;
                                              font-weight: bold;
                                              color: #b70404 !important;
                                            "
                                            target="_blank"
                                            data-saferedirecturl="https://www.google.com/url?q=https://www.lazada.vn/voucher&amp;source=gmail&amp;ust=1686840370820000&amp;usg=AOvVaw0YsR60EPE0BerUfP5s_hhV"
                                            >Mã Giảm Giá</a
                                          >
                                        </p>
                                      </td>
                                      <td align="center" width="150">
                                        <p
                                          style="
                                            font-size: 11pt;
                                            font-weight: bold;
                                            font-family: Arial, Helvetica,
                                              sans-serif;
                                            color: #0f146d;
                                            background-color: #ffffff;
                                          "
                                        >
                                          <a
                                            href="https://pages.lazada.vn/wow/i/vn/LandingPage/global"
                                            style="
                                              text-decoration: none;
                                              font-weight: bold;
                                              color: #b70404 !important;
                                            "
                                            target="_blank"
                                            data-saferedirecturl="https://www.google.com/url?q=https://pages.lazada.vn/wow/i/vn/LandingPage/global&amp;source=gmail&amp;ust=1686840370820000&amp;usg=AOvVaw3Kh-R77Ulo1sRrHJfXyWqX"
                                            >Ăn<br />Thỏa thích</a
                                          >
                                        </p>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </span>
                  <div
                    class="m_4836663727624563565section"
                    style="padding-top: 0px"
                  >
                    <div
                      style="
                        color: #f24c3d;
                        font-family: Helvetica;
                        font-size: 18px;
                        font-weight: normal;
                        text-align: center;
                        word-break: break-word;
                        line-height: 150%;
                      "
                      valign="top"
                    >
                      <strong>Ưu đãi dành cho khách hàng Thân thiết</strong>
                    </div>
  
                    <div class="m_4836663727624563565section-content">
                      <h2>Bạn ơi,</h2>
  
                      <p>
                        Xin chúc mừng bạn, bạn tích lũy đủ điểm cho các khuyến mãi
                        sau:
                      </p>
  
                      <table
                        style="border-collapse: collapse"
                        border="0"
                        cellspacing="0"
                        cellpadding="0"
                        align="center"
                      >
                        <tbody>
                          <tr>
                            <td align="center">
                              ${contentPromotion}
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
  
                  <span class="im">
                    <div class="m_4836663727624563565section">
                      <div class="m_4836663727624563565section-content">
                        <div>
                          <b>Lưu ý:</b>
  
                          <ul>
                            <li>
                              Thời gian và số lượng khuyến mãi có hạn, nên bạn hãy
                              tận dụng cơ hội này.
                            </li>
                            <li>
                              Bạn hãy yêu cầu dùng điểm tích lũy của bạn cho
                              khuyến mãi khi thanh toán tại quán.
                            </li>
                          </ul>
                        </div>
  
                        <div class="m_4836663727624563565two_col" align="center">
                          <div
                            style="
                              font-size: 10px;
                              line-height: 20px;
                              height: 15px;
                            "
                          ></div>
                          <a
                            href="https://c.lazada.vn/t/c.VkePT?sub_id1=voyager&amp;sub_id2=processing&amp;sub_id3=20210715&amp;sub_id4=main&amp;url=https%3A%2F%2Fwww.lazada.vn%2Fhelpcenter%2F"
                            target="_blank"
                            data-saferedirecturl="https://www.google.com/url?q=https://c.lazada.vn/t/c.VkePT?sub_id1%3Dvoyager%26sub_id2%3Dprocessing%26sub_id3%3D20210715%26sub_id4%3Dmain%26url%3Dhttps%253A%252F%252Fwww.lazada.vn%252Fhelpcenter%252F&amp;source=gmail&amp;ust=1686840370821000&amp;usg=AOvVaw3V1oR_YzdKkruM7dQ9lTiJ"
                          >
                            <div
                              style="
                                background: linear-gradient(
                                  45deg,
                                  #ff7800 10%,
                                  #ff00aa 100%
                                );
                                color: #fff;
                                border-radius: 10px;
                                padding: 12px 25px !important;
                                display: block !important;
                                text-align: center;
                                text-transform: uppercase;
                                min-width: 140px;
                                border-bottom: 1px solid #8f8f8f;
                                border-right: 1px solid #8f8f8f;
                              "
                            >
                              Còn chần chờ gì nữa, hãy đến quán ăn liền gà rán
                              lotte cho đỡ ghiền.
                            </div>
                          </a>
                        </div>
  
                        <div align="center">
                          <table
                            border="0"
                            cellpadding="0"
                            cellspacing="0"
                            style="padding-top: 1.5rem"
                            width="100%"
                          >
                            <tbody>
                              <tr>
                                <td>
                                  <a
                                    href="https://c.lazada.vn/t/c.VkePT?sub_id1=voyager&amp;sub_id2=processing&amp;sub_id3=20210715&amp;sub_id4=main&amp;url=https%3A%2F%2Fwww.lazada.vn%2Fwow%2Fi%2Fvn%2FLandingPage%2Flazmall"
                                    target="_blank"
                                    data-saferedirecturl="https://www.google.com/url?q=https://c.lazada.vn/t/c.VkePT?sub_id1%3Dvoyager%26sub_id2%3Dprocessing%26sub_id3%3D20210715%26sub_id4%3Dmain%26url%3Dhttps%253A%252F%252Fwww.lazada.vn%252Fwow%252Fi%252Fvn%252FLandingPage%252Flazmall&amp;source=gmail&amp;ust=1686840370821000&amp;usg=AOvVaw37hth8eDxEuFJ1F8ZHK1cD"
                                    ><img
                                      border="0"
                                      style="max-width: 225px"
                                      width="100%"
                                      class="CToWUd"
                                      data-bit="iit"
                                      src="https://www.lotteria.vn/media/catalog/tmp/category/Promotion-01_1.jpg"
                                  /></a>
                                </td>
                                <td>
                                  <a
                                    href="https://c.lazada.vn/t/c.VkePT?sub_id1=voyager&amp;sub_id2=processing&amp;sub_id3=20210715&amp;sub_id4=main&amp;url=https%3A%2F%2Fs.lazada.vn%2Fs.Z2oii"
                                    target="_blank"
                                    data-saferedirecturl="https://www.google.com/url?q=https://c.lazada.vn/t/c.VkePT?sub_id1%3Dvoyager%26sub_id2%3Dprocessing%26sub_id3%3D20210715%26sub_id4%3Dmain%26url%3Dhttps%253A%252F%252Fs.lazada.vn%252Fs.Z2oii&amp;source=gmail&amp;ust=1686840370821000&amp;usg=AOvVaw2rxL-E640KroPXGaZAv-Gh"
                                    ><img
                                      border="0"
                                      src="https://www.lotteria.vn/media/catalog/tmp/category/Promotion-10_1.jpg"
                                      style="max-width: 225px"
                                      width="100%"
                                      class="CToWUd"
                                      data-bit="iit"
                                  /></a>
                                </td>
                                <td>
                                  <a
                                    href="https://c.lazada.vn/t/c.VkePT?sub_id1=voyager&amp;sub_id2=processing&amp;sub_id3=20210715&amp;sub_id4=main&amp;url=https%3A%2F%2Fpages.lazada.vn%2Fwow%2Fi%2Fvn%2FLandingPage%2Fflashsale"
                                    target="_blank"
                                    data-saferedirecturl="https://www.google.com/url?q=https://c.lazada.vn/t/c.VkePT?sub_id1%3Dvoyager%26sub_id2%3Dprocessing%26sub_id3%3D20210715%26sub_id4%3Dmain%26url%3Dhttps%253A%252F%252Fpages.lazada.vn%252Fwow%252Fi%252Fvn%252FLandingPage%252Fflashsale&amp;source=gmail&amp;ust=1686840370821000&amp;usg=AOvVaw1FZ1K5UlRAISgbb5mSaM_0"
                                    ><img
                                      border="0"
                                      src="https://www.lotteria.vn/media/catalog/tmp/category/BG-Menu-09_1.jpg"
                                      style="max-width: 225px"
                                      width="100%"
                                      class="CToWUd"
                                      data-bit="iit"
                                  /></a>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
  
                        <p></p>
                      </div>
                    </div>
                  </span>
                </td>
  
                <td bgcolor="#B3B3B3" width="1px"></td>
                <td bgcolor="#D1D1D1" width="1px"></td>
                <td bgcolor="#E8E8E8" width="1px"></td>
                <td bgcolor="#F8F8F8" width="1px"></td>
              </tr>
              <tr>
                <td colspan="2"></td>
                <td bgcolor="#B3B3B3" colspan="3" height="1px"></td>
                <td colspan="3"></td>
              </tr>
              <tr>
                <td colspan="2"></td>
                <td bgcolor="#D1D1D1" colspan="3" height="1px"></td>
                <td colspan="3"></td>
              </tr>
              <tr>
                <td colspan="2"></td>
                <td bgcolor="#E8E8E8" colspan="3" height="1px"></td>
                <td colspan="3"></td>
              </tr>
              <tr>
                <td colspan="2"></td>
                <td bgcolor="#F8F8F8" colspan="3" height="1px"></td>
                <td colspan="3"></td>
              </tr>
            </tbody>
          </table>
          <span class="im">
            <div>
              <div>
                <table
                  cellpadding="0"
                  cellspacing="0"
                  width="100%"
                  style="min-width: 663px"
                  border="0"
                >
                  <tbody>
                    <tr>
                      <td
                        align="center"
                        style="
                          padding: 0px 10px 10px 10px;
                          background-color: #ffffff;
                          text-align: center;
                        "
                      ></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </span>
        </div>
      </div>
      <div
        id="eJOY__extension_root"
        class="eJOY__extension_root_class"
        style="all: unset"
      ></div>
      <iframe
        id="nr-ext-rsicon"
        style="
          position: absolute;
          display: none;
          width: 50px;
          height: 50px;
          z-index: 2147483647;
          border-style: none;
          background: transparent;
        "
      ></iframe>
    </body>
  </html>
  `,
  };
  let rs = await transporter.sendMail(message);
  console.log(rs);
  return rs;
}
