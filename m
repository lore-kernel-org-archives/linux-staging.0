Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F441C3C04;
	Sat,  5 Apr 2025 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844403; cv=none; b=S6+ejcL3prHtR4VzR9YsyOQFIR/tVRD5agQ5uEG5pYnFbPa7b0E+dc8fefuw+MP4Bd643pGAlE9mZEKvqSNQvQR1zcNwRljTsdTqOYp8rLx30KAjhYzwYBCJRxyYdQSDIYjHjqanEkjjx3at2nlpLK74zEyB1226DicHxi1HjHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844403; c=relaxed/simple;
	bh=pfEubIKNeeFOnL5gyDmaebVebKzbDrXCOVJJAbB4UVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etvxqeJFAs4i9JiaQ7YFsEaXX2UWuotGaixWq5lwBPfgl4YoQO1X1gTLpPKtOaQTFfWiJry58CfIbu8//fye2SicLj05yXtdQ2ecm1i0mTqCSXUarMU8jpoVUjVF7g0DVjjXX+COfuvPx7eqDxVpSPYRJbeHL4Mmaq99TZ4S7rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4CKH/1y; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4CKH/1y"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so2361153f8f.3;
        Sat, 05 Apr 2025 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743844400; x=1744449200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6ZR9eFKjGpMS/icjDm1o4uzi+JHmRFmvVzNAUIZTO0=;
        b=R4CKH/1yL/bdOQsPzJ7v3YDhYcbNaDt8uRKf/2EJRey+DsL5+RcagCK/0fXImbPpSe
         2aEV6wy+5qntzLSUobBDJWCPB3rR//lFZ0g2kYr/Ed2WCI6T2/sTwwKIB6ilyBK0MQp6
         hrLINgTlAzvZYlIW1ofOXJRZkeMsuS2dJoe01O6m6svnqUR/WJcPwaxtE17nGJx3uEnQ
         fkkQ8M6+NcKGz4Cowc/ezFVn1hTJWgSZMYr6ExxY+ZHnS78cNiwLUEZE+O5znx3zBA5i
         gu7RixE+1tIBFp0XNAnBYJb2ZPl2x0mHElcpCaCOVKcOASD4ZRhTrw44854SG6rEBTGy
         6Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743844400; x=1744449200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6ZR9eFKjGpMS/icjDm1o4uzi+JHmRFmvVzNAUIZTO0=;
        b=SxWkv8KfbJIIsHBwMQM5IN3BV212qT4rPUEqGZbCV83CcBBD4h5D2574oj2v+qR0jE
         144SJY4ZwryN9KRq7LBDM8BZMMGlwuwh1uXnbd/4QezIMcrqls0SfTm+hAIXhk/DT+NM
         zDbeTaE4KnVWMo73FxeimIhhM4n0/Otp+kpoAMlsgDbqL5dwWxLL3QOkHf+QOF7rPHcn
         ejLBdi+iw5TuCbTZ4v6Zzt517bYMrAdsAtMJoxQ0C0RdHo+9Zv4qt5TzFUCITpLAZSB7
         YWNBs2xbSfc3pIXTk+jJY2NXG+2CKqRKPb/jK/9YfA+c+zbNdpQ9i24+mjAR57X4gXp3
         DE1g==
X-Forwarded-Encrypted: i=1; AJvYcCU0IE3y+rrDX6dU3g+YT/PUSEEGrCSTDizWWiKAnQh4hsXt5YZLDGTNCuN1sGAIIZJhru7EEB0h+oxo@lists.linux.dev, AJvYcCX4lEU4yyjJ7J/L6PdJOtWLaQlIR/PX0X8NBbNxvIov4c8bAdTVe2IEd/TNcJwIuOR1awiumet3Xieh8SzX@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7VXEaYl3fHfGavq1pru8gsimJW0JmOXRYgSOZ//2eZ39JtgB+
	ZuJL3m+Auqw/3HLtD5QmaNdzupPfp6/r3h+yvpy5V4ZKgjOZabjT
X-Gm-Gg: ASbGnctlA4gXqKwXL5GF+Hli9rAPQm18zMDp/IPv9StveRPxsVETE1uYuZvZRE8hfrP
	wE9vdUVfF4L9A85TPCJhDWEP2XX82rzoEbjGy6XPkY8gV8WQEM0woq8JJJkxoUQdv+rHr0vOldE
	bw1hiSb/gwkX80dwle0FXnt3SO+YykG5HSohMAZFW1vQn1Yo4XhpJpom+2HoeZ6/UPKUKUocS57
	UqPFfYLbqn4JQANYCOOfWRxl8JnRjQgRsBlNWd0VHLxarjOtWd95byhviZhDGOs5M/Gbcb/l1fe
	1klAlaIby/330MBgKw0ZoJDI2CrGQxSwPy61mqb0Pn+CN4+V1s27mSTv2UE0Fg2d6Qe4SXws7Gi
	M9TdNsto=
X-Google-Smtp-Source: AGHT+IGfzl2pv5IsDRt5SKn785/yDIiUNWg/VF2UgOdPy4T5iI2Zl3GW3bzzP63OL0/FBxHZiPw/Lw==
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr4865881f8f.26.1743844399679;
        Sat, 05 Apr 2025 02:13:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm6444591f8f.61.2025.04.05.02.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:13:19 -0700 (PDT)
Date: Sat, 5 Apr 2025 10:13:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall
 <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Dan Carpenter
 <dan.carpenter@linaro.org>, "andy."@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <20250405101318.3fce2dd5@pumpkin>
In-Reply-To: <Z/Bro47isE8zhcu7@ubuntu>
References: <Z/Bro47isE8zhcu7@ubuntu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Apr 2025 23:33:16 +0000
Abraham Samuel Adekunle <abrahamadekunle50@gmail.com> wrote:

> Replace the bitwise AND operator `&` with a modulo
> operator `%` and decimal number to make the upper limit visible
> and clear what the semantic of it is.

Use 4096u to make absolutely certain an unsigned module is used.

	David

> 
> Also add white spaces around binary operators for improved
> readabiity and adherence to Linux kernel coding style.
> 
> Suggested-by Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 297c93d65315..630669193be4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  
>  			if (psta) {
>  				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096;
>  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
>  
>  				SetSeqNum(hdr, pattrib->seqnum);
> @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
>  						pattrib->ampdu_en = false;/* AGG BK */
>  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096;
>  
>  						pattrib->ampdu_en = true;/* AGG EN */
>  					} else {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096;
>  						pattrib->ampdu_en = true;/* AGG EN */
>  					}
>  				}

