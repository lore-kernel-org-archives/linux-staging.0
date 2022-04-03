Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2767E7A;
	Sun,  3 Apr 2022 15:34:05 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id e16so12968773lfc.13;
        Sun, 03 Apr 2022 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIC6+nPyLNVJaE3S1OhJgHqXEDSVnYfTyjeRKg1mrs4=;
        b=GeYFG9nTDUXSnCsLuryw0kNRtPQSYiO5g35lKNgE14JldKA6j75lNmRDchCCdAgpUv
         cmD35zgE2pewBFV9E9dchYEWjvM8ONvkxcbhH6wZMyN1tLGGLXrAKY0d8Q26OiVtT3jI
         tN+2na86ZvTOipKrQLA4qV5dP2z4Nmvzy9i1dmoQBgyZHmzo94K9cfDGCkZt0yt1FnkE
         mmBaDqWdBI1U+DWtKKCgmH/2CKjVA00/AOnI/eyhbvLECA1XIhFBw0u9KBGrMwzwHvc/
         Q6XgJjkqLa6IcPRTZZUOTlKJXBi6GxwvsOtX0uf1tKg2wyEk8FfaO/incESquyAXeqtm
         VHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIC6+nPyLNVJaE3S1OhJgHqXEDSVnYfTyjeRKg1mrs4=;
        b=2Y6vriPf0ngyvdoh2Z9loYrz/93tTk8RVMXJ/f3y7SitWR/5KtAtPOcGkTQP0KTnex
         uvIrtehYH9771iCng/RWg4aRMp0XPsvevJC7mQ/5eOj4ixA8/c2aZIu2Aik3iS9l+IUd
         w1WRpIMaantUcAhdwRQ0lnBCE4sBq5oEALkG9vUw7hJuZCWBziLf0Xsnou27XKPgMN3c
         K726JhYFuJaVaX34mE6RN37gjZxWDsFqiAo/bCvQBJaCttI+AAqjLBaADtu17fJ2QsuZ
         ZXHdsuxKQNXyLKmo6cHdiI7tVLSFyD9dStwXf2w/cqG2rVqiePj4rea2xXHipZVIKQcT
         gafw==
X-Gm-Message-State: AOAM532jHwjbPzw43zXsE/O4p7cCLLF8EgNNGz2MEGsZ78r9SWlFFgc0
	GMJ+ErL/YDh4AVEq7T+1DGCTH+DjEAQVTt323Eg=
X-Google-Smtp-Source: ABdhPJz/nL7zr6+3VO14htVnHlFLPjNAmBSr7VkYGC+fRtykkcRSWiIqb+qKA0SfyySBsesv0QEbHeKCnKq1A9izojw=
X-Received: by 2002:a05:6512:b91:b0:44a:d2be:7ad3 with SMTP id
 b17-20020a0565120b9100b0044ad2be7ad3mr10510438lfv.538.1649000042918; Sun, 03
 Apr 2022 08:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1648817213.git.sevinj.aghayeva@gmail.com>
 <8d745122cd10f5db59393b1bff09e6a73e88640b.1648817213.git.sevinj.aghayeva@gmail.com>
 <Ykl+5reEIg31WHyy@kroah.com>
In-Reply-To: <Ykl+5reEIg31WHyy@kroah.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Sun, 3 Apr 2022 11:33:51 -0400
Message-ID: <CAMWRUK6iuyRguC67J2ErzBp6p86OzaqxNDxhKUU=Gpw6crj3TA@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: rtl8723bs: remove redundant else branches
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 3, 2022 at 7:03 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 01, 2022 at 09:02:47AM -0400, Sevinj Aghayeva wrote:
> > Adhere to Linux kernel coding style.
> >
> > Reported by checkpatch:
> >
> > WARNING: else is not generally useful after a break or return
> >
> > Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 63 +++++++++----------
> >  1 file changed, 30 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > index 81e4b1bf68f6..b80d9061f5a5 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> > @@ -907,10 +907,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
> >                       set_link_timer(pmlmeext, REAUTH_TO);
> >
> >                       return _SUCCESS;
> > -             } else {
> > -                     /*  open system */
> > -                     go2asoc = 1;
> >               }
> > +             /*  open system */
> > +             go2asoc = 1;
> >       } else if (seq == 4) {
> >               if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
> >                       go2asoc = 1;
> > @@ -1502,32 +1501,32 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
> >
> >
> >               return _SUCCESS;
> > -     } else {
> > -             int     ignore_received_deauth = 0;
> > -
> > -             /*      Commented by Albert 20130604 */
> > -             /*      Before sending the auth frame to start the STA/GC mode connection with AP/GO, */
> > -             /*      we will send the deauth first. */
> > -             /*      However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth. */
> > -             /*      Added the following code to avoid this case. */
> > -             if ((pmlmeinfo->state & WIFI_FW_AUTH_STATE) ||
> > -                     (pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
> > -                     if (reason == WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA) {
> > -                             ignore_received_deauth = 1;
> > -                     } else if (reason == WLAN_REASON_PREV_AUTH_NOT_VALID) {
> > -                             /*  TODO: 802.11r */
> > -                             ignore_received_deauth = 1;
> > -                     }
> > +     }
> > +     int     ignore_received_deauth = 0;
> > +
> > +     /*      Commented by Albert 20130604 */
> > +     /*      Before sending the auth frame to start the STA/GC mode connection with AP/GO, */
> > +     /*      we will send the deauth first. */
> > +     /*      However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth. */
> > +     /*      Added the following code to avoid this case. */
> > +     if ((pmlmeinfo->state & WIFI_FW_AUTH_STATE) ||
> > +             (pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
>
> Very odd indentation :(
>

Just to make sure, are you not happy about the existing code or the
comments being indented? Because I've preserved the code structure and
have only removed the else branch. If you could clarify, I would know
what to fix.

Thanks!

-- 

Sevinj.Aghayeva
