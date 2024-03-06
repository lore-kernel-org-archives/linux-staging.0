Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C5A26AE9;
	Thu,  7 Mar 2024 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814062; cv=none; b=sZetcvc/AR7HJ3hWC5lF26MKyFv5yXLMhpR+P2Wvn06uVYNy1MFbYEA2O9cX+9oLFN9HXu6X9iidtb3CACw//Y9K7lDi9PjG6iX47vh9qyXeWC98Bx7HfggODXPp5AYZG3sEMQ3N3lfp9cSlFp1KJqSOZb1BR1cRqImcT+Emjoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814062; c=relaxed/simple;
	bh=kqk7LEGVjgiDMDM0djEFWDJHkLmqvzGpAmo+FWCIKcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oK1M7xsRxxhc2uuSsJhbVSvIxVhgeokhKuP5BfhLW7k8h41EgbBg3RIFqGD3aX6wBWoxvT6abgsbm5pzA4IdKufviL1l8uwm2oHwn1v4m/D9Rhh9znyvVQ1n5une1mwLWHTuriyWP1xYOJ4ANp5wPz/pU6fIojL5QXprGHg6nbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOrQp3mT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOrQp3mT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso354864766b.1;
        Thu, 07 Mar 2024 04:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814060; x=1710418860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzltjEBVR1B9pqJY+uo3T/bnxNmD4jZBSPT+xQogS8Y=;
        b=SOrQp3mTin3+gvOxzOTjTH1y/EmP255TL4nYxK7bHa4rgAXw/pl62FNTCwkiYpAzVN
         5IdhprUI4AMiVpP7jAoo0nixhrbs4/sDNhSMpN9q+kRogAlC/pitKe6pLQj5U/HxwrnW
         3+ER670So58clYZ06tLVeZwBXQfEoFE1nOc+i9aH0USZJtBxVoacjmflRUKs4fD31PXA
         IjZtLbGesqxBlyN4LONRMik2SsuQ5APxX/u3mdnKawmvC8Lxf+1C9bePwrIS4H6I9Vd8
         2Zq/rvh4hvWdhov6mYjEQiASpuKC7m5IcDykGaFCaEw5j8wj6DIxkRbXjGyCRToe4EBD
         tgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814060; x=1710418860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzltjEBVR1B9pqJY+uo3T/bnxNmD4jZBSPT+xQogS8Y=;
        b=e+uyPdYOfKn4l0KstZ4w8wyaA3Z5fjNd7idfNrbOMiZ5gUWBvYd5W/Dp8ZzS/1K/2u
         KvSfEpPU9gDN1KWdlw37xi0oUVECHQsYHIG5C9Hg9exX0I+ISmQvqDAS6SVPYx+/7VSF
         IWSSJUsUXdbW+RqM3hjBlTmX+lOWGZYfkPqo/GuZ0XHSaTSw0P+9fOfIS1V1v91k0/yO
         ByQX6iaVoALQ6Mksz07cQH5HSrWQF+Qfq662CuagECLRQS1OnWwbKclU9EqG9qW8gDbq
         bsNQLW9ca0U8PWwMx+d4NPgm6tjkHdyzNRPmfZeykKbQlwELfuHxzjMmfnGN2q0DGIUL
         /QcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGhaXI1R+15A+ZYgjYPlz2TvLkf0jfL+cAmQEh0IQhHYXcph+/aPP6NyFFHsuCYtmV1FxQPWohdVcff76FYEps35tbyVGoA+GPTqcoDhIGb24WZtG9l+CyPax5XQ8cTNRcBIn08oFybQ==
X-Gm-Message-State: AOJu0YwCvTlC7ywy+9cUVcB56PU2frYAxum8U8lTl1xriWNxHi7efRuC
	fjfOTaVmguRsS5YhgLZmHLYQnu3WY/WonUM7JKflDXdhgnQ55pJSk+qvFhfvwKk=
X-Google-Smtp-Source: AGHT+IEwieh2q74XRMWDqtjlzsbZtKDGE/NzbwnO2Bh+SxI5P5hfh7peYYbaw0etkmaNoGsDw7UZRQ==
X-Received: by 2002:a17:906:5acf:b0:a45:6d38:60aa with SMTP id x15-20020a1709065acf00b00a456d3860aamr62943ejs.30.1709814059678;
        Thu, 07 Mar 2024 04:20:59 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:59 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 7/8] Staging: sm750fb: Rename variable sii164CheckInterrupt
Date: Wed,  6 Mar 2024 04:36:10 +0000
Message-Id: <20240306043611.98074-8-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
References: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164CheckInterrupt to sii164_check_interrupt to
silence checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added patch to series
    Compiled the kernel successfully
 
 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index ac1aab77da28..1def02be4cce 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -23,7 +23,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
-		.check_interrupt = sii164CheckInterrupt,
+		.check_interrupt = sii164_check_interrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
 	},
--
2.25.1

