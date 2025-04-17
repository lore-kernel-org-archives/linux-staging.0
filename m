Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9BC19D882
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849974; cv=none; b=IytmnShuMpkmdr5F96vvSJS/54eHQIiP17Yhkua1x2ZZjycMH+0RlS2V94dSxzUerWNGjB8Ol1d141sVfI4rIfSKkrWDUtcWl5FK8w68nizBl6JK85jGt0o3puu3FYPKkCXpe2Qt7qBOFAWFTE9S1tqDCALd8jZLxM14G7k5CvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849974; c=relaxed/simple;
	bh=9qC6SADjVBvrGdZqgD61dD4ij9DtU63SWTFy4hBsTVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH34aLCLtLbraqnakqE3jDM0cIYwMrxEPKkfQ0jnzohOLSWKhp//ufcAPkooKldLVb+2+QzvmBQflPJ8VuIBk1LQq58Tp0H3QFuGC+YAMycN+v+PaQYfxs8iQBGa9JQlwGw6Y2K9zUi1NhrazGW6WARtNGmpbk0181iAs/gq8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=TRqI1ue4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="TRqI1ue4"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso217297b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849972; x=1745454772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=TRqI1ue4IG7lbsOW90MfEbT8+bNlUDI9zHfkFkRAIUV/fW+z//XVIlBC+Hrr+bkeiQ
         8PeS0C93vvB9QDITTjLNEtXlxkMXniYJLMVYhu618yqsLroTuhgSZOv9TSJr/wyIN7/k
         D6wA0X/VzTO0IxOHCXyL3s8bjC6jLz44iz6obq7EpV5sRd+kJNLqlVlG9Lh2/XT7KREv
         4gLS/fAV5367J2ciDUQBhPtAKxgTX6fozagw1yFPnlbZ/UMdPbuqZBtxTavZ4+IK3CUh
         AQUG8BDahTmFsxPNhOJHs2XptDZz4nXolphmHltkIEQl4aSj+t6lmnm6QHJNNf5RMzP0
         fS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849972; x=1745454772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=fnNjmZ5fgZU4aGyh84P+U4z7xEqyo6oUd08wH8of5QJdiV9+lJwBvOA42N+1zlvhoa
         AygjdwbyZjejzKfZGXd7xl3DWV/YNPZ4dOfbX/gpG451Gk5N2slCjdvN1YXCxz1sgPqH
         2PFEfda0HjWFpCznwZiiQMnkSD3P1tpzW3VmAQs+u61LvQp/I85w0D6WGhspgG3eSlg5
         UJ4/OL9u85CC9QjMiYMTTM4y4f7VZ9P4EHlmOcxVD1i83RPVWkJTGXt/i0/2qKAn11xY
         d9Z6A59CQlyC6Lf5pQ10Du6oIqcIxevS1xPVhgXM5/RB2DXpz4MUBA4qjflBiKQK4z78
         82IA==
X-Gm-Message-State: AOJu0Yz+BCCc0LwOt8gxhgM3lykUOuwswoSfJON7fKZ8jBdkW9l6JaIC
	iEvkFRIpArz/B6Meuo7xxNebwXO/SJAFHEVaEk5pcuAD6VThHLo6ZCOzFYdrXw==
X-Gm-Gg: ASbGncs2fuMiWSreNqPiSFTxmuk3ZJ5g8x9iJHQJl83yMeOR1aGiYvwz4VHQu8TWv1f
	X3wv3NAhwX2cvVjDUVA9baT/BZ8MhV+eTuxQ3Jf8XMWbDR49vDpn3iiZK0+wWoZddphB/QUPTHa
	Q+kzkBIDSnmmbOTdxdzpVNWL1MOtCC2kEc4aXSqLLry+0VP4wSIulCrSR7+nXQaDpv0Ip3l2/Ug
	4mVE9oyPTYOrfbSzbPJFvli9zNpiCg0KD7w6Z9PKCXVdgbK5AN1Js6BEWXXshIRnJNUVZ0lJqMc
	nTr8k0N5SWIHqg10s/Na4U6XiCoqmrxmuE4A3QhAp6kdP8PlJ9FQMF/fA/A6CBcsVu9XNnSWNwx
	iJP1tfg==
X-Google-Smtp-Source: AGHT+IHj2i15EYTCpVnq8XJ+QWcgY36lBAVDCzPpKYIxC0Qq4MKiJiwczINEofcKe1ulTXvKThGFfw==
X-Received: by 2002:a05:6a00:710d:b0:73c:3116:cf10 with SMTP id d2e1a72fcca58-73c3116d5f5mr2140061b3a.23.1744849972222;
        Wed, 16 Apr 2025 17:32:52 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c4e69sm11430781b3a.53.2025.04.16.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:52 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 03/18] staging: gpib: agilent_82357a: gpib_interface
Date: Thu, 17 Apr 2025 00:32:31 +0000
Message-ID: <20250417003246.84445-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 7076e9f57d69..9e41fe611264 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1434,7 +1434,7 @@ static void agilent_82357a_detach(struct gpib_board *board)
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-static gpib_interface_t agilent_82357a_gpib_interface = {
+static struct gpib_interface agilent_82357a_gpib_interface = {
 	.name = "agilent_82357a",
 	.attach = agilent_82357a_attach,
 	.detach = agilent_82357a_detach,
-- 
2.43.0

