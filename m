Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D42C80
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633798286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jhkTisAzLueFjEQ5vp959zU5veAEKBJB1nSIxVUvRI=;
	b=Hfs5TBg46jHdYGyDDMBRXsNh6Oy15OaMmH5hHMXsPFWocK1UCvQ7RW6NSmiPm0L5JxkuRi
	lhXsSK2Ijcmr1494YLII6FSkDNmNxQwI7HvZv+xMgXEToJOTpro9aDUlaWcLuchhCWd0ye
	KI1nEfVFJqxspTHI/UHBBPse2Fiq4rA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-PL86XTNLMjSsUV5hzQSuMg-1; Sat, 09 Oct 2021 12:51:25 -0400
X-MC-Unique: PL86XTNLMjSsUV5hzQSuMg-1
Received: by mail-ed1-f69.google.com with SMTP id c8-20020a50d648000000b003daa53c7518so11859846edj.21
        for <linux-staging@lists.linux.dev>; Sat, 09 Oct 2021 09:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0jhkTisAzLueFjEQ5vp959zU5veAEKBJB1nSIxVUvRI=;
        b=uW7B8EI5V20BWjcE/4H63KocIGcV4HaLAqzvcvFrNNHqSYC9wQFf4M3wEDtdELQ2Jp
         9+za0hsvmD87wJYvqQUaH8TPlVjoMnGJQDlomhrkLaD4NgbD8MOnpuGKvDsiSjuhJanb
         WQey5d5Emza8Hu4ZkiZvboAxKz2HWz5brAKoFtToP2k+5k5KIJuySOOo5O0YfpMuRGyF
         lAtwKyrRSjtx7ZyxsJ72fW93nWTrLcZ2Wa6hyT4TeTh/AMtMVZ4UndvOMp6q+ya3m8lB
         f8uSCfVQFj8PBvBoOdoiS7+Q2p0DY3lg68QApm5/d/8H1EhIM6geY8mxhHN2WdWQofEl
         R+zA==
X-Gm-Message-State: AOAM532kRENI9WkiCls/3EuVamAWBxnwrH+oRjFB0Nv9+up6kdS3K2+i
	6fAUCmpeiEqaU5BTIFv2B1U95EIkiJcuQfnN91zNN4O8u5j+wYRd7RELX6IbWoOy8oAWLcksNdp
	RSRwyed6faScmdi+1py5+QqLgaQ==
X-Received: by 2002:a17:906:8a45:: with SMTP id gx5mr6219525ejc.144.1633798284145;
        Sat, 09 Oct 2021 09:51:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXfk2ROfWAGprSF17LQwM+9KZastpHfzZgNyntGvMLAQIAfcvpOnjsvr7EwImIcFncjRFRtQ==
X-Received: by 2002:a17:906:8a45:: with SMTP id gx5mr6219503ejc.144.1633798283882;
        Sat, 09 Oct 2021 09:51:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c11sm1473287edw.5.2021.10.09.09.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 09:51:23 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: core: simplify the if condition
To: Saurav Girepunje <saurav.girepunje@gmail.com>,
 gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com,
 deborahbrouwer3563@gmail.com, marcocesati@gmail.com, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YWEwFf0YMi4W1xKN@user>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <94cb79ea-1952-c92c-f5c9-f03f7b1a892c@redhat.com>
Date: Sat, 9 Oct 2021 18:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YWEwFf0YMi4W1xKN@user>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 10/9/21 8:00 AM, Saurav Girepunje wrote:
> if psta is NULL, function is returning with fail. On next if condition
> again checking if psta is not a NULL. Remove multiple if condition check.
> 
> Function is already using goto exit statement to exit.Replace multiple
> return with goto exit statement.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 61 ++++++++++-------------
>  1 file changed, 26 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 34505b35a7f3..4e4a1bed882b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -932,49 +932,40 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  		/* TODO: fill HT Control Field */
> 
>  		/* Update Seq Num will be handled by f/w */
> -		{
> -			struct sta_info *psta;
> -
> -			psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
> -			if (pattrib->psta != psta)
> -				return _FAIL;
> -
> -			if (!psta)
> -				return _FAIL;
> +		struct sta_info *psta;

You are now declaring a variable after some statements, this will
cause a compiler warning in some cases. Please move this variable
declaration up, grouping it together with the other variable
declarations.

> 
> -			if (!(psta->state & _FW_LINKED))
> -				return _FAIL;
> +		psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
> +		if (!psta || pattrib->psta != psta || !(psta->state & _FW_LINKED))
> +			res = _FAIL;
> +			goto exit;

You are both removing an identation level here because you are removing
the compound statement which contained the psta declaration as well
as refactoring the code.

Please split this into 2 separate commits, 1 where you only drop the
extra indentation level (and move the psta declaration up).

And then a separate commit which just the actual code changes.

Your current patch is very hard to review because you are doing
2 things at once.

Also it looks like this patch depends on your previous patch:
"[PATCH] staging: rtl8723bs: core: remove empty else section"

When patches depend on each other please send them together
as a single patch series. E.g. for version 2 (v2) of a 3 patch
series consisting of the last 3 commits in your local tree use
(so the next version of these patches) use:

git format-patch -v2 --cover-letter HEAD~3
$editor v2-0000-cover-letter.patch 
 <describe series contents + what was changed in the cover-letter>
git send-email v2-00*.patch

Regards,

Hans


> 
> -			if (psta) {
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> -				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> +		psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> +		psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +		pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> 
> -				SetSeqNum(hdr, pattrib->seqnum);
> +		SetSeqNum(hdr, pattrib->seqnum);
> 
> -				/* check if enable ampdu */
> -				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
> -					if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
> -						pattrib->ampdu_en = true;
> +		/* check if enable ampdu */
> +		if (pattrib->ht_en && psta->htpriv.ampdu_enable)
> +			if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
> +				pattrib->ampdu_en = true;
> 
> -				/* re-check if enable ampdu by BA_starting_seqctrl */
> -				if (pattrib->ampdu_en == true) {
> -					u16 tx_seq;
> +		/* re-check if enable ampdu by BA_starting_seqctrl */
> +		if (pattrib->ampdu_en == true) {
> +			u16 tx_seq;
> 
> -					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
> +			tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
> 
> -					/* check BA_starting_seqctrl */
> -					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> -						pattrib->ampdu_en = false;/* AGG BK */
> -					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> +			/* check BA_starting_seqctrl */
> +			if (SN_LESS(pattrib->seqnum, tx_seq)) {
> +				pattrib->ampdu_en = false;/* AGG BK */
> +			} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> +				psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> 
> -						pattrib->ampdu_en = true;/* AGG EN */
> -					} else {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> -						pattrib->ampdu_en = true;/* AGG EN */
> -					}
> -				}
> +				pattrib->ampdu_en = true;/* AGG EN */
> +			} else {
> +				psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> +				pattrib->ampdu_en = true;/* AGG EN */
>  			}
>  		}
>  	}
> --
> 2.32.0
> 

