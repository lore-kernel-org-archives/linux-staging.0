Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EBB187F
	for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 04:59:53 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id os14so1167782ejb.4
        for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 21:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GwpkC9yTrxhMXwq2N8bYIHvfqMibB4bpkErq4zQeW9o=;
        b=D0S0JOgroVz3X0uzXJFoqCgvDR+ZbwU6hxFNKpeMj4gfbN1yT0enP4HINK/eVVTBlq
         thwbQ6beAt3o+Xd2vbFwDHurOEH3nnWLGVmHevz62YLKteYOlR+jtnovk28QHUrdAoAA
         YkuHzcTU0HKvM7VvMEuNhcYItEK/zHTN1UzSlczzHV1ofcNoNc64iUpkYbWB3BJoRxDR
         SXPoIyenX+YXX64uxlG+S8tCeq7iQXCPgYNpjON62+OfxLB4ZjtldgHoRY+31eiJauFD
         ss7yY+dT0MHRoS4HWluggFUBy+2w+nP3Nn3u3qrlsd5xLtpU7eO7HMF8aYGAZMGjeILH
         bhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GwpkC9yTrxhMXwq2N8bYIHvfqMibB4bpkErq4zQeW9o=;
        b=zgucVdhNjzsf37MwufNhrUc/c5tb5lyryPjhLT2G37m+kzOPkGfMnuemrxXZKHEHNS
         GXDKWdt8/OGNYGmrsD5mBo/RH48hr7jcR8q+2VOkMTWAv5flyyvmAJDrnq7UZQYpGbUw
         Ep94dFzjjlQoPahVz4tSe0SCb511310jiccFtB3WwWHFpDjZCbFIuPcsJZy1Y4v1mpWY
         MgbqgU8ewsvJ6plWSqT43EiZRi8zqIZNbFMZKLNqQv5Zd+L0wENgf/0E494Bl+tB65Pa
         Dzv/kRkXdk65Lw5KD+z84wPwPd5ITC6QvvjMwiQcFQ3anN55Ly/Ln6UpRIOWNmhAjmCo
         XrhA==
X-Gm-Message-State: AJIora85zGOVeM2mnH1mGIK9sXSKoV3JTAPARz2i+SysHlt1HHr1xUUM
	OygBWcTMLulySOdnVB7PDe0=
X-Google-Smtp-Source: AGRyM1vDyKpAZWy12vt6CcoeVg2TA45Wx+akFGzi0UaT6Z/WxzJtnvaGdbOGmYlL3Iv+8QsP1VhpNg==
X-Received: by 2002:a17:907:6297:b0:72f:9aad:fcb with SMTP id nd23-20020a170907629700b0072f9aad0fcbmr691963ejc.161.1658379592068;
        Wed, 20 Jul 2022 21:59:52 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6957:c533:5c06:b4c0:1c8c? (p200300c78f2e6957c5335c06b4c01c8c.dip0.t-ipconnect.de. [2003:c7:8f2e:6957:c533:5c06:b4c0:1c8c])
        by smtp.gmail.com with ESMTPSA id z24-20020aa7cf98000000b0043aba618bf6sm395784edx.80.2022.07.20.21.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 21:59:51 -0700 (PDT)
Message-ID: <b12cf068-9494-b38c-a1a9-8ec3d68f906e@gmail.com>
Date: Thu, 21 Jul 2022 06:59:50 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: Inserted empty line after declarations
Content-Language: en-US
To: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 Rebecca Mckeever <remckee0@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 Vihas Makwana <makvihas@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <a2747f00-99b8-10a2-edf5-7dd6fd7a1f8b@gmail.com>
 <20220721035146.11719-1-abhijeet.srivastava2308@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220721035146.11719-1-abhijeet.srivastava2308@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/22 05:50, Abhijeet Srivastava wrote:
> Warning found by checkpatch.pl script. Resending this patch after
> correcting my Username
> 
> Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_cmd.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 5b6a891b5d67..6fbf6e4234cf 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -25,6 +25,7 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>   
>   	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
>   		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> +
>   		if (c2h && c2h != (void *)pevtpriv)
>   			kfree(c2h);
>   	}
> @@ -323,6 +324,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
>   	/* prepare ssid list */
>   	if (ssid) {
>   		int i;
> +
>   		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
>   			if (ssid[i].SsidLength) {
>   				memcpy(&psurveyPara->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
> @@ -334,6 +336,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
>   	/* prepare channel list */
>   	if (ch) {
>   		int i;
> +
>   		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
>   			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
>   				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));

Hi,

I am sorry to tell you that this patch is unlikely to be accepted.

Reason is that you need a [PATCH v2] subject and that the change 
information needs to be below the (signed off line and the "---")

Find an example here:
https://lore.kernel.org/linux-staging/20220718021241.GA8270@cloud-MacBookPro/T/#m7a25ce1dd320c742bfb0ca0236ca06476d8dd8eb

And read about the canonical patch style.

Consider that the next version you send is not v2. Because this was v2. 
The next version you can send is already v3.

Thanks for your patch. You can do it.

Bye Philipp




