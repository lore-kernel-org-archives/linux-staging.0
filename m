Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABF1E1A33
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753902389; cv=none; b=ft1v8XC0W22Cqlc7hPA1vl5iY2LQa998P7XqlPBvglaxfuzw6+qpoKz1j0M3dgbhn4IMetPhgxTCkRsj5Ku6rlsNjPa0Gyrv7IBkeviC7DmRdH4qtl8AYNVdepOz9HO3ihBmbzufeiGHhT2RbW6Rv6JXTPpFwprZgJTv6lz7GNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753902389; c=relaxed/simple;
	bh=6KVv13hT5JsR6YdNzNX5uk/jXpAm7CYMxH6SaNm6F2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=smuLr/pCj7hE2N/xyiSXFoqiYvx1JC03E0IWUmBRfjZHB/lNVGS6XeVwpnKaQJiQ34t+rKQsuMWmq7X+E4lf9MivYAJFtNkAnWPHHzQE/1nqpgpR1ARBLOiTeuStqW20czPgDv0glR4gBs/HP2eowqgnh9KW2/AthIGFEog3myk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuNYXlA8; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuNYXlA8"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e2c1dc6567so19536585a.1
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753902387; x=1754507187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybVQcVFyEdYnpN12omIpuUPF5pVwuzWEDeaUsFMkJkM=;
        b=iuNYXlA8yhlVx914YWu/jpbpX5yHJ2NlEPlm4bEcKtKndvoIFS1DzjYNw2MS5z9UAa
         sQZaicbJOtxhtFWoOKgXS4Oixto0FeJFSJkLayHw4DlYEYrIWQpD2kKvODSe4BVmeZmt
         B4NwrVyMcCOW/NRs9QnVfWwTCaFnrWPuen/lmrJAFV/y96e23T84h9SKbe/kWfjdXjZW
         SeBxm4g4PXUa1qMSvz/0Kq61ZRT4mdbReMKiGHDkUC1qcj00kmfZxNz8hNjdrcWK8/c3
         oTNPrVjjzZ5sp5Tnfcs6LBNoALDErnnqyZmOXg9ga7wOUemhrUaQdT/0urOhts66nUVe
         OJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902387; x=1754507187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybVQcVFyEdYnpN12omIpuUPF5pVwuzWEDeaUsFMkJkM=;
        b=PfYmw2hQli1Jv5J1duRz4CD8zDYNOpUufqFZ4E8M9BSRSbFfP4F5ueq8TcMW/Vqzpj
         upGoy+jFfoyWryZBlsjYuCklD3a+cM5Lr6W+AeKROAq1T1CpgOxbM4Abel+1vXRAEm65
         rjwvAJ6jYo3y0g1/TRgoeb/DDZtIHYp4LmE8GTCkHD0Sd08TnMCIMf/r6XzJhOD79uS6
         twX/E4rx1SvW2PLUAQyDmYMCpieWirjZtqh4WGJMCtb5iXcKn1OKFArR+NTc+ncF5E2J
         DBoUTksPuImIbfBr05g1+S7em3i16lPHA1qB3XmtvdEq0AcShDUKHsH+QB0FyoauD+4z
         fywA==
X-Forwarded-Encrypted: i=1; AJvYcCWVFt+Ed4fQw+JPsgjzth+yEPlEBy5rhyxNwFCz1gyxV64xAOMpryV/DEEC1mz4iXgKeYaCWXrhZ3YrBXIz@lists.linux.dev
X-Gm-Message-State: AOJu0YxFiVCw8GUpjJ1HVGviwE6e0oXx2aYLF0g8gSFIhMqR1MWndqHm
	wjWLOmjpAueW0GXVSRwARcIqZyYtrCbv00hUJHC/iz8/b2kq9CZ3WXvE
X-Gm-Gg: ASbGncuUsmYzvG/sFHG/i3KnWXjNO9+jwTdyjx8AcXOyM4jpkwYmVYRzEA3nML7Ojlp
	jE0WvXjTpRyUnTWYXyfytDICtNF8ydbb4nM9NRctFr6zAqkDSqh/uaE4O/aVYbKuL8Rp0czzOSV
	PmKDFnNgSNhGaY6lc2KDsDYJW8UOqITxITxaWVvel847f91hIaXSCBxDUx/O3z3kfNgn+9XQ6Iq
	5bZo9q+Fo8xEuJEiEbePBWHCeUSKPtTIhFF9C8vC8HzGmFxu9tcVqd1MvS49yGUHJdZFYH5RotF
	5gLlu/ykWFaQ8mvma6YBf2ueGBxRXlJZzI6yWlwlt+Mg5OM6GWT3ff85FwWLRNupxpzqA/ZFxyg
	G0es2YEl3yKtG788ohiAeAD5CEYGkC1zuCO0fQvLg6v9hgdQMJsw=
X-Google-Smtp-Source: AGHT+IHLclzYu0Z5jQH82f2rH2WaZHw9fp1kXrSjViyulmKi/bc1CxAr9BwKnxR6p81aGiAVZl86dA==
X-Received: by 2002:a05:620a:4720:b0:7e3:45e0:ff41 with SMTP id af79cd13be357-7e66f3637e0mr622267885a.38.1753902386470;
        Wed, 30 Jul 2025 12:06:26 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6438a1345sm618286385a.82.2025.07.30.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:06:26 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vivek.balachandhar@gmail.com,
	Markus.Elfring@web.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 03/20] staging: rtl8723bs: add blank line between rtw_roaming() and _rtw_roaming()
Date: Wed, 30 Jul 2025 19:06:15 +0000
Message-Id: <20250730190615.500904-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730042032.488456-1-vivek.balachandhar@gmail.com>
References: <20250730042032.488456-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the definition of rtw_roaming() to separate it from
the following function (_rtw_roaming()), improving readability and matching
kernel coding style guidelines.

No functional changes.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
v4:
- Reword version note from "Changes since v2" to "v3" for consistency,
  as suggested by Markus Elfring

v3:
- Move version notes below the '---' line

v2:
- Place the '---' marker below the Signed-off-by tag to follow patch
  formatting guidelines

v1:
- Improve patch description for readability and better separation of
  function definitions, as suggested by Markus Elfring
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 357fc6a56c27..f8680124ce24 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2449,6 +2449,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.39.5

