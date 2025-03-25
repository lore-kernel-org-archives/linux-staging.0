Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48FEC4;
	Tue, 25 Mar 2025 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742913769; cv=none; b=c5HuGZ3YoHdnczRFNOppEQx9WQk02yp2kNHY3SD3iI5520UANYQH5hEnd9V1T099jkgyL0NmQxY+tVV9vY/S0lXJWHnVd67jczOk93yntCNozk8tfL3ufOcDuspGUjLY9vJGuq2hSKtQBYaPCLpcwUBywNlqQqvWuOtN6h7E/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742913769; c=relaxed/simple;
	bh=Vk7lu+k/LxGfSIe4a8nBRYhg0IP1gdWBVQeXlEMh/Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yzi+APaBJzXN/8R5O5d+kFj5RbRjd6PGN88vPTkog8P/ceXffixlwmE9P/07WJpBoCZowtwIzZSEVK72y9LV8ednN64OP9s5KwsIt91IkMdsd3QpVgQFdXeEsbjH556jfTL8yzMnCHEPT2cpYPdHy5JJce2RTOTpeQcu9bqjNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgxVVnp9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgxVVnp9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac345bd8e13so1005762266b.0;
        Tue, 25 Mar 2025 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742913766; x=1743518566; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifjnDb3LR3+EXG2gLg9Iuod7C3gy4u+/OHVZr6cmIUY=;
        b=WgxVVnp9mDs/1Zk4AlC6lgeaVlHDFZAKzxvBrtaw54ICi1X64cCK2oAwqeaa0pu+rV
         6BjSWZon1YwI7wwgE00ZfZcy6SLYV7EdkAiJce6ZnuQtACLUVsLFHphNA7Xz/LSsVr4W
         oBbBvPrvwcnMeHyi0vO46mziahhEKBFWc40SZHFJAGWs1p8UJqjBwk6Ae0OPd4mNjYgj
         cWV15TXt8yW+mQ9Vc7ZTsPXRGjZUgH1a+BShYWC3B7BCgMgTIsywbH6RQpINV5TUObPh
         wVaO47JhGmdOCGfiWl4y70N0YfG/dlIWPXY1EsQ4dBiAMhsbFp7es7lmO259AKWkrzrh
         1wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742913766; x=1743518566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifjnDb3LR3+EXG2gLg9Iuod7C3gy4u+/OHVZr6cmIUY=;
        b=Jd7vGwKnJu0KQnNBQOf6rmAyyc9tGeXgh7Ph/V7ACOiPlg4wVncL0+xDzckThoHu0k
         XhjobYZTbc9K7uQQTRd1ADweFG52t9z3ViKE5y5RoxVvAK147beheZZgPrVnsvcEJ7+8
         7/lUm8vSn0f5CQSUW34h0EHaRh6it5gJquuC6i6T0D9JVvTp0JdhmW0D5fZB+kC0bMof
         rUpmvxpfl1IHZBHeFiZJgox8uk5OLjbIXlyFru0xe7C8tTv9VJ1msQ1iWz00Oafdjv8N
         UAdkY8Ty8sNstRprLxt7KldDy8l3WOV35n583TybTZD8w+R6Codn4d6jl99rlhgWDo8u
         Hf7A==
X-Forwarded-Encrypted: i=1; AJvYcCUO4N+tbWLXYyus6gXUux1mZbXiQK1ZD0/2MbvNBtFa4mQff6xlWAYyt4h55lDRobX9eeri9DZvW24=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBda1B6ZmjF2dBhqj+VU8FL8fcnW7CTd9P9B+fr7NmdoJnMLoS
	s13l6pYHAXLBmMUWEs8RYqcmcdoHvOOlAm8pTsLcgEM7kThuidTW
X-Gm-Gg: ASbGncvV/fmpY/2MMeVnBd7xSUY7VSSeY12MhpHRZbHh+kMd56tSCr1XzdizA/+26W8
	V6TDrj3Utu8WYmKj7ZvHP/Nzc7SEIe22oAeZnffr83I+IW+tmc+tsnK8XQord6cO0sj9NaywkTP
	n0e9mq7XaymqyJKf0ryVIPSDAoQ5DbBLvjKA8UykDqtSif3BXkpFBJFc9GGojrJ9+E5wz6JXQnX
	3pfqgHGzWkXV3A0xM0Xf39OuE4XO7+d0Bj/6lWp7qjETTf7q0fewT7Tx8cuF9DyhkH44GaGLmJJ
	P42+Tir+nYsYB+o4BpnFX2PzPPjx/kROz94p/SeFWxZsCM+SEA==
X-Google-Smtp-Source: AGHT+IGC8+tqW/1yJe1dg4+8ZsCRTfU/nKmyirtXygvgBHP4Qtsc3PrlbHnyd/E1spsS8y/6s0kKqQ==
X-Received: by 2002:a17:907:94cb:b0:abf:7776:7e0c with SMTP id a640c23a62f3a-ac3f23e00e9mr1451400966b.33.1742913765279;
        Tue, 25 Mar 2025 07:42:45 -0700 (PDT)
Received: from HP-650 ([105.112.117.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6964189f1sm421150366b.33.2025.03.25.07.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:42:44 -0700 (PDT)
Date: Tue, 25 Mar 2025 15:42:33 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary else block after
 return
Message-ID: <Z+LA2eeFRL+K0KCy@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The else block after the return statement is unnecessary since
execution does not continue past the return statement.

Remove the else block while preserving logic making the code cleaner
and more readable.

reported by checkpatch:

WARNING: else is not generally useful after a break or return

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..91c6a962f7e8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2022,12 +2022,12 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
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

--
2.34.1

