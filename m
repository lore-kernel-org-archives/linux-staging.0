Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75133EEAC2
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784598; cv=none; b=Ia/BxNeaEZs6+SDS98f3UEsL9rbALjYTovE0gPYuGykrnwi8f9ZmPiNH+Zk5J/Ucj+zNAVT2k5YX9SuC5rsxP/H343G9ipr9lfqc7/f8FOKDh3StG7mXbL8g3PjrIf01vy8mVYa4TMZSxbOPy4SldbkUjFg0x9a904koWzp47UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784598; c=relaxed/simple;
	bh=SfbOzbA3MKHsGeTbafSXSu5EYcsHWSO9YIZOKREiu/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PXtzk8EGlwrDEvLNXoyq2EuxppXISO/53WX+iIIpEjUF/w7QhCsRA38O9bandsODyhhwthvLuobSKHFlMfRk6qnHcsdZYTzYMe4lDWzfs8Ltf94h/SrpiiBApyQQbDI72zln3so8PiTaWAHXS3SejtWYnXeo72a+Sga6y4INHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEmdO4Qi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEmdO4Qi"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ad4c0c94fbso914809e87.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781784595; x=1782389395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=BEmdO4Qi3I5srNnNhmGNmxHdVKcv8IfJqbCJWsODx+X05Waq/wzm20ip73TLO2htcK
         yUYBMedUxS3yCyNa0DTmzqU58pzi4FFPv9tiZ3w+oMjxO5hY0Hgs/D3bg92nyBTGcxUI
         uDiqIkNT47hPtySMYRwB/Rkg+8y2QuCE1A941MFdHHQJ/MBgA9giHWkTFJV0zt6uSrrI
         eNtHWa8tE4hogQ5qR1qiOctgN7RFZWASb2vENKYyGYVPLLI/XKMHIQX+9jI7m/0sn8mB
         BGbGsnSDFYV6MK0aPvWNh0rP/TfCdVALi9iwG/HSTYepW4u9e3vf38j26DVi7AGlDsKr
         BQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784595; x=1782389395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=CHKydMaJtdqe/3cc54C977KH+8zkqTdLXf1/7UcUvaWadre1F1G/9Do5gJfcxm8apa
         x6YYKy0ybvL3xSsPsFsEJTwGdzLZZTxnlsz0lmlrJXlVM94Y7ojLEbmKgHhb9u9UUYTk
         jtneSTFhkXDU/PQ/URE5mBBoGQFwbH7V1EuPpHX/WwgF0+wr8WicyiJqv94YL3hRUPS1
         amBSraq9U1gAqFXHdnQvh9wMxceLNS0WJSs3lMxo4D9Gd0Jbf8O5bBqRS24AWn7dvbqk
         Qjj4xiDIWJwioZGTwdPLreXzs/2smi/4Zes3Nymv2gaUCHeFIMQyvRyC5oiWH94T0k6q
         6oqA==
X-Forwarded-Encrypted: i=1; AFNElJ8M1uZkH7k2P8Y4CSeJR7LnVzfies+B7KT0xA3tjcsuJyKe52qa45aiATrxhL/0F0rM42f3Z0F9vIo28hQE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3QUzyaLLSyJQXF5WmnHJKPraUKppb0jVqqHzDgAJBiTkRssRK
	rYz4hkttmJTbW01dsPg8x7K152advksYJ9U4rqgt/tAoLujcysm5KwL3
X-Gm-Gg: AfdE7cllcc/SzllWEhCrBP23Zbo+5CE7SX9VSYdl/vysZtYSOUWazlGjRO4W/u1WgtT
	ePg/5TXICHmf1lUFHmgfa935hBSJ9EsO6yfujd7kmREfUxP2jqtetnJDWNfTLqv3Ljoz5Uz3pCR
	NoUmUUDfiRkA4AHGazVs+mGraG//NKiCSkvazTuWux8JRRVD1yuB3OgBcQaPdyVNLvX0YPCUoY1
	Db9+PRtwL+dibfP2Ga3qEwZHwtou7cXEAuwa6TukgWVoUUFgvRYrE9TXtaUlReW3Ge0HwBQWgmg
	T8UJqhVSobnc1Z/ah8+5jTXQnKWRiBOEWZkU33wi6h0iczVf7RYrYr+l0i9AVlnxh6hek3EGab6
	tPSmIW3YdoGFNMJX9SDpCPN7KbJOvVij+wyR3sgVoZhbQsFakv/Ks8cB12UVVBZlN+IH6kTwY9y
	++/JolpEeQgovaCRsgc13dBUjPbwX+yfiyqoFk1Cqk
X-Received: by 2002:a05:6512:3993:b0:5aa:6b70:325b with SMTP id 2adb3069b0e04-5ad46fcbe46mr2559870e87.7.1781784594852;
        Thu, 18 Jun 2026 05:09:54 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-399731bc028sm10485911fa.5.2026.06.18.05.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:09:54 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] staging: media: atomisp: prefer __aligned over __attribute__((aligned))
Date: Thu, 18 Jun 2026 15:09:51 +0300
Message-Id: <20260618120951.42956-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the GCC-specific __attribute__((aligned(a))) with the standard
__aligned(a) macro to match the kernel coding style.

The checkpatch.pl error about complex macro values is a false positive
here, as enclosing the macro expansion in parentheses breaks declaration
syntax.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/platform_support.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
index 473d8d4fb9ba..9aa445c45e9f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
@@ -20,6 +20,6 @@
 #define UINT32_MAX UINT_MAX
 #define UCHAR_MAX  (255)
 
-#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
+#define CSS_ALIGN(d, a) d __aligned(a)
 
 #endif /* __PLATFORM_SUPPORT_H_INCLUDED__ */
-- 
2.34.1

