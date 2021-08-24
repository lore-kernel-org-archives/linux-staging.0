Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FB73FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 22:02:11 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id k14so21125473pga.13
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 15:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ux4PWshDQUgun7+iFfR9XF7lhOb6fujLGbBAlBGfMDY=;
        b=st9U/bkuHb6ONLcWA/fEAKEtp7tFDqFymiFz1XavxyMqttCfESEX2UzFYM3Jw+n5Vh
         AqCW8Q0nLLYtOxodnbaioTh2igkBGRL9xAkDXTbG8ADzqVcapeVuZ+iErKPZzD5omYMg
         YQUthZGSSY/KEDiRJ1aWxjGJmBeNB2Cz9aZRNRC1ZHR0dS48eha1tHI3HGLPM25iocog
         u7mcnj+jiIfflo8ITvR54uda3tzHElE/yJt375MHJBZ4VOj+EAqgStjWDKKmINEknMPI
         8dFCsdKUUAj7pR4Jl59+3OAYVnRkULuNTxHU/SLMKBzI34ZDoygZrExHM1S/01Yba4C6
         jm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ux4PWshDQUgun7+iFfR9XF7lhOb6fujLGbBAlBGfMDY=;
        b=apxvLGCr3A4mo5Gje11LCDugiJzWuj6DeUYJLT2PaxG3DpN0zK9i5MyFYQ/VhNXUuV
         UO46Bj0TX8+3vd6szO6c86T8vtqAiFX1yD9M9Tbfsbx4xrV4eU4q7COh47l24vJw2dJN
         qYDHskfFh5rzA3Tmsip6BGjsUlcQaSSpMg7PhW98v8F16u9iId7WB00v+DE9b8G9Q7zm
         +GIrJT889Xq9twveg0hg4ZDmARHgu1/mgq6qAdvUVwp+6DsU05J0608VLEnha6+3E4wz
         hzi9Mobg3nTecd6Tq0jDERjUtlNJn6Da3qdKxzNW+22FX3uJ/fqZxPLofyX19aDx8BkK
         spvg==
X-Gm-Message-State: AOAM5322jaYlnYGE51GHyO3c8J0bnE6sdyDANB8qGCTw7Yd/kAxmI769
	5YM0b8slYHXu8st1vS7d+k8NB3Vk25+3VSKShE4S7A==
X-Google-Smtp-Source: ABdhPJzg04bwOiBQ9nJT9JRFZwqlKjT7duzDhTp79seoHsEIWF0MYTJgbcHJlD0C9utgAVIliWv3ksK9VRJIyQ5zUvw=
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr41431417pff.71.1629842531034; Tue, 24
 Aug 2021 15:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210824063443.59724-1-deng.changcheng@zte.com.cn>
In-Reply-To: <20210824063443.59724-1-deng.changcheng@zte.com.cn>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 24 Aug 2021 23:02:00 +0100
Message-ID: <CAA=Fs0=yWZ58j7T_vE4SjT3Fv35Zxb2rohQF4V9F7sF78LTR8w@mail.gmail.com>
Subject: Re: [PATCH linux-next] r8188eu: remove unneeded conversions to bool
To: CGEL <cgel.zte@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jing Yangyang <jing.yangyang@zte.com.cn>, 
	Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Aug 2021 at 07:34, CGEL <cgel.zte@gmail.com> wrote:
>
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
>
> Found with scripts/coccinelle/misc/boolconv.cocci.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 5325fe4..20dc4d4 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -3758,7 +3758,7 @@ int issue_probereq_p2p_ex(struct adapter *adapter, u8 *da, int try_cnt, int wait
>         u32 start = jiffies;
>
>         do {
> -               ret = _issue_probereq_p2p(adapter, da, wait_ms > 0 ? true : false);
> +               ret = _issue_probereq_p2p(adapter, da, wait_ms > 0);
>
>                 i++;
>
> @@ -4890,7 +4890,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
>         u32 start = jiffies;
>
>         do {
> -               ret = _issue_probereq(padapter, pssid, da, wait_ms > 0 ? true : false);
> +               ret = _issue_probereq(padapter, pssid, da, wait_ms > 0);
>
>                 i++;
>
> @@ -5605,7 +5605,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
>                 da = get_my_bssid(&pmlmeinfo->network);
>
>         do {
> -               ret = _issue_nulldata(padapter, da, power_mode, wait_ms > 0 ? true : false);
> +               ret = _issue_nulldata(padapter, da, power_mode, wait_ms > 0);
>
>                 i++;
>
> @@ -5728,7 +5728,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
>                 da = get_my_bssid(&pmlmeinfo->network);
>
>         do {
> -               ret = _issue_qos_nulldata(padapter, da, tid, wait_ms > 0 ? true : false);
> +               ret = _issue_qos_nulldata(padapter, da, tid, wait_ms > 0);
>
>                 i++;
>
> @@ -5839,7 +5839,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
>         u32 start = jiffies;
>
>         do {
> -               ret = _issue_deauth(padapter, da, reason, wait_ms > 0 ? true : false);
> +               ret = _issue_deauth(padapter, da, reason, wait_ms > 0);
>
>                 i++;
>
> --
> 1.8.3.1
>
>

Not had time to buildest/run this, but it looks ok to me. Many thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
