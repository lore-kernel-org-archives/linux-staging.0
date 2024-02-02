Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382417C98
	for <linux-staging@lists.linux.dev>; Fri,  2 Feb 2024 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860838; cv=none; b=TKP3ksSUq67hyD0ETNLAWK0DGzq05TZWD52zfCvJ9Ryup0M5LJAx4gjoBgx+xQVQIV7mNvclNdJJSDznnLLHeISUIOyS1jGf1mw/ppXLSE0A1ZFMNK9xql4e1kHhUSCYDRYOndCM3MOW7cQnaRbW9db014mHYEbaH7bVno7v0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860838; c=relaxed/simple;
	bh=5C6mtoK2qwsl7ZgvWbaVivd7y93FRbznXiXFi9bZTPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUjjuwWtBb6rRNs5Ug+MvN6gHzCRr3TnGhGTMA16LNCrKXBCXGrWFrD7jPDfyM5ajUbsKvMJ6d7+Q8Odb9SnxCqbyBVMSohDOrzMtUGfPQ5aqnGi7+DpS2M/VlagM/l5yf+AhFFj1hjQPszROsiKGxqUhPT9L+kPLuNqVufZAvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gHWNNoBL; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gHWNNoBL"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a349ed467d9so227628766b.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Feb 2024 00:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706860835; x=1707465635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CH9v3LCO5nHQUt3/kuRRJfaPWt0ulylMcQsh3OeI2hY=;
        b=gHWNNoBLMb3KX4b0wMoMsdPqx7rPSz3nutzvNR5D2O3S7dhq/JJYiU2XqU8LRKHGWF
         i52Act6eIGLcnXGdPX2ETXm47UY2ua70lfBfw6oPT2ZYAg9KTAYqFQju+nD1EoYGx6A/
         P5EUrzeZTX+A71rMRvaUU+3tNcdS6XHY5ph2qpd1YhTuvzIh23NIpJnoOiqr1iybZBph
         0k1xmmQBCd34IP+wXY30KipR5j24T315u1fEuQR+70ldoyeLl0JF/mrAmIvsSJVLEM29
         kF32ocdasB5/Lw+K61KJcHuKu1e1TQVsWbWK9anBDtpKQfE4PERwFxqx0T5ohNblfKzS
         yDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860835; x=1707465635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH9v3LCO5nHQUt3/kuRRJfaPWt0ulylMcQsh3OeI2hY=;
        b=jg3E+gBZALszroSULoHbqstCeutF7Vn8ePnLqfe6cvfXEfrXIaMPrgncufftWosvJ9
         s/0cMC6DPBepjCng+mmMRwjAN0VGwGKKDaAEQJEGH2KxSDWlcG8q028KLzvgkS0fVOpZ
         z16+KoQ3et01KTQUbgvwvl/AnRc5TKncpmdjXMkyAIEbKL071FLPk2LwveIHI+962Igk
         kL7enzMH0hVBFC7h8cwizf0F1hBx8EZHc+gaXMu+84AUGtLZIQgF37Jl1CUbskORd/0D
         IZuIc/jEp+fIpoSdDlnlaRWT0xV2L04D81NPCfFvNdD0tpPuhy7pUiLij3srJZBQDQ/s
         KQ0Q==
X-Gm-Message-State: AOJu0YxI+EJJA48xRXKSAf1cns/g56mvCVIkYVI4XgQIY6U+MrQZR4oP
	F1oxKMusCy7gOx8I+2/JKJ5/NPZEYlz/Z54AEhqiQ3LiWdtRFCyMnEARnX+e0ag=
X-Google-Smtp-Source: AGHT+IFAaPKR1CV3s/S5gqowYd2TGEghpCGQ9spaAICaF6GW8iRHbkjrt0f9pwME8hYTpTinDKLeqw==
X-Received: by 2002:a17:906:9c43:b0:a35:8d47:70a with SMTP id fg3-20020a1709069c4300b00a358d47070amr746597ejc.36.1706860834910;
        Fri, 02 Feb 2024 00:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXwZSz6WlkQqMIGhBTSJkaR/WejvNIGOorNU8wowqgR+ymm10on/sT8ADGPlGMt9oYdwF50Hs1+VSLfug5897nSJuq3elGM2rqS8v1sJya/LMUhTB/Tjl6odIuzanZp/gTSDNqO7IYDv4xpWtJMfYx4YAf7jJH4nvHLsiYFyc7lNYHbNys67r2DzxnP51lH5P2Ohpe7rdmZBOi277IMxQpY17SRs3KEBKSRBNOS8NLti7wPV5C43e0BwKCIrrtjZeBCD8tEo3npDB5cRQ==
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ti8-20020a170907c20800b00a3617097f49sm603096ejc.101.2024.02.02.00.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:00:34 -0800 (PST)
Date: Fri, 2 Feb 2024 11:00:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] Staging: rtl8723bs: fix else after break warning
Message-ID: <9f3378b0-916d-4213-9696-854c970ab383@moroto.mountain>
References: <20240201140459.438479-1-meir6264@Gmail.com>
 <20240201140459.438479-5-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201140459.438479-5-meir6264@Gmail.com>

On Thu, Feb 01, 2024 at 04:04:59PM +0200, Meir Elisha wrote:
> Fix checkpatch warning:
> else is not generally useful after a break or return
> 

This commit message doesn't work.  It needs to explain why you didn't
just delete the else statement and pull the code in tab.  And, honestly,
that's what you should have done...

regards,
dan carpenter

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b221913733fb..c99fa5f1716a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1552,10 +1552,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 					continue;
 				}
 				break;
-			} else {
-				rtw_indicate_disconnect(adapter);
-				break;
 			}
+			rtw_indicate_disconnect(adapter);
+			break;
 		}
 
 	} else {
@@ -2103,12 +2102,12 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 	}
 
 	iEntry = SecIsInPMKIDList(adapter, pmlmepriv->assoc_bssid);
-	if (iEntry < 0) {
+	if (iEntry < 0)
 		return ielength;
-	} else {
-		if (authmode == WLAN_EID_RSN)
-			ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
-	}
+
+	if (authmode == WLAN_EID_RSN)
+		ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
+
 	return ielength;
 }
 
