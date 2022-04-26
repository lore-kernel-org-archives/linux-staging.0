Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F87E
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 13:30:34 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id l18so9462379ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9hl53RDLcEPM/nSUae5c5JsKEwpcuy6BZdj1d4ixjQY=;
        b=OyFIjV19hIRjjXAPc0wgjhOnHWZ3+c4L+2p56KMi2XTOanUPfonQAvUr/opteP6qae
         CoA0+xr1wtR/CaoyMSqvswgpz11Ik8FEc61i/A6I8jhHrRvk86vj82EvawebjmesVvPs
         h7vkRKzhiPJ5XpDUdjxYrWLyxO76hGdtTkGUc9Pvh4W9PQollXhO0mJjiPE2boY2ssOi
         J8giaV4PfE29bn4WD0MMcSTQZr88hfwt/SDOc9eVTE3JkW3jf0CO2ZDt0Li2nbMzpl6c
         llxGJWXj8R5O1lCYWKTKTR+jnXXPgMg50En0AThYDpjl8LOzyenaCwRwcCvZvI0+M0QT
         nUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9hl53RDLcEPM/nSUae5c5JsKEwpcuy6BZdj1d4ixjQY=;
        b=ZlCvFIDp6DUFOIC7vV7zicGAFqzH2Eam4/VMuqKG5H1+Rl7po+mYnVyxEsKFSxpqV4
         BzarUswk7ra20x6oWjWDE2VGa6mOOCwuGhbrlqHFuJWbujv+5ZbExC5hj/4stgVrXsmE
         4oIK1/VqAbx0eQsSzwEPR4LPVbU8Ph9InNm/QmI4+rTmBtlEXHPtOczad5T47zyHrt2w
         60ZQWoXszfIzc1BFTsVneTnghSZtCimVVap4eZqUlWo766Io4M9vdNtgMOy5FBhJT7mt
         q6hb+8kB9QiZBDGSsehklaibA0hUOEkdan4KMfIMY+NjinGlPGtZvyW4Coh5BDK/39CY
         kfaw==
X-Gm-Message-State: AOAM5305w4nBQv570OjhXHjEtc0BC0JhfHe3HdfGxlJsj33NZVE2elBF
	YNwq2tHX7b0dzxFB5W0Wp1QFS7e0E4Kq1dZNT39MGg==
X-Google-Smtp-Source: ABdhPJw0AIRBsmqStssTQgBZLCiq96WN/QJZfjyQ6xjAwWhJWxXNv6YpYjzmcyQUk44U4E843wTMp8+UeZ7SiP5AHo4=
X-Received: by 2002:a17:906:dc8d:b0:6f3:b613:6adb with SMTP id
 cs13-20020a170906dc8d00b006f3b6136adbmr2150897ejc.670.1650979832969; Tue, 26
 Apr 2022 06:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220425105346.324864-1-benjamin.gaignard@collabora.com>
 <CAAEAJfA2K2-YOruDMUjHixaPa1wfTSwpb3K5A-y_i3H6BF7oKQ@mail.gmail.com> <d2e699a9-6c2d-ab87-f23f-4b42096d64be@collabora.com>
In-Reply-To: <d2e699a9-6c2d-ab87-f23f-4b42096d64be@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 26 Apr 2022 10:30:21 -0300
Message-ID: <CAAEAJfBnFat5OUHxN_3N=Yn2F6vPiueB3sftC4WSuqY6hTKOeA@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: HEVC: unconditionnaly set
 pps_{cb/cr}_qp_offset values
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-media <linux-media@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jon@nanocrew.net, 
	Adam Ford <aford173@gmail.com>, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 12:28 PM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 25/04/2022 =C3=A0 14:12, Ezequiel Garcia a =C3=A9crit :
> > On Mon, Apr 25, 2022 at 7:53 AM Benjamin Gaignard
> > <benjamin.gaignard@collabora.com> wrote:
> >> Always set pps_cb_qp_offset and pps_cr_qp_offset values in Hantro/G2
> >> register whatever is V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PR=
ESENT
> >> flag value.
> >> This fix a couple of tests in fluster.
> >>
> > Which tests?
>
> CAINIT_G_SHARP_3 test.
> Hantro proprietary stack (g2dec tool) does the same.
>

Can you resend adding this information to the commit description?

Thanks,
Ezequiel

> Regards,
> Benjamin
>
> >
> > Thanks,
> > Ezequiel
> >
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 9 ++-------
> >>   1 file changed, 2 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drive=
rs/staging/media/hantro/hantro_g2_hevc_dec.c
> >> index 2c8eb0720db8..bb512389c1a5 100644
> >> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> >> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> >> @@ -194,13 +194,8 @@ static void set_params(struct hantro_ctx *ctx)
> >>                  hantro_reg_write(vpu, &g2_max_cu_qpd_depth, 0);
> >>          }
> >>
> >> -       if (pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSET=
S_PRESENT) {
> >> -               hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp=
_offset);
> >> -               hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp=
_offset);
> >> -       } else {
> >> -               hantro_reg_write(vpu, &g2_cb_qp_offset, 0);
> >> -               hantro_reg_write(vpu, &g2_cr_qp_offset, 0);
> >> -       }
> >> +       hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset)=
;
> >> +       hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset)=
;
> >>
> >>          hantro_reg_write(vpu, &g2_filt_offset_beta, pps->pps_beta_off=
set_div2);
> >>          hantro_reg_write(vpu, &g2_filt_offset_tc, pps->pps_tc_offset_=
div2);
> >> --
> >> 2.32.0
> >>
