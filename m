Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA8185E;
	Sun, 15 Oct 2023 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsyEosCs"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a7ab31fb8bso42038647b3.1;
        Sun, 15 Oct 2023 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697369251; x=1697974051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFbOF3573uN2XsjzuWMYl1qqk639YGQ/7wnYm7Gey2M=;
        b=NsyEosCsBV9DpGWsTof2twTbKw7sljnOHZ+UkFbhNgg0TTI48NINlGRjVxWSyTLqV4
         mvRSoCLWwHyP7hA/CJ5V0h942MtfafSHtkCDrNZw7LaMs9qWriS1YHXAsGsEgNKfJrTW
         vWMQnbEiEo47MwYnRgKQl2B2Xsa2dLpL6rmDp7MuuTfYDMblKVjfcAVV7VlGx6Oe5lmo
         IEEaZdX1ja2QOlWTC0z7f+sic8SwyETnStjFLsnG+khYLnH4dpqF24kzUQ7V7cqoqkI5
         ZkvxEd2nJb/nJTyJ0dHsqLYG8Kd38Rf4k5GvfAOeArhzG6UoblArM3eVi27EbtCgDGUn
         gs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697369251; x=1697974051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFbOF3573uN2XsjzuWMYl1qqk639YGQ/7wnYm7Gey2M=;
        b=cqPrIFrFNaBiGYND1007xt/w7X04yr3Nr7rHoAh5orxf8TSt9PSW7dzPvlPa8TIXBL
         oT49OxaGNQLjz7rUyzAWI5Zm97XsbnoomYwGMBROPrGqjtNSKuj0m2piweziZv8p0C8y
         7W+YIhC4lmw73yw7z+NYnzo3ORBnW4hVhbpXL0P36hW9DgPcXRWPXsIVs9lqXFD6O9YT
         RdRneNytY5nQXPV3J4GxodT9bwp8pXwNBiVAZISMOadOcr28+FCAweTWa7Fj+LklixbB
         YmXRqc3UJgRIRIVrlcJJ2/Ok/QCHcER3+l53Dg/Kn0kZwYBqZl/f48Yx5v82q7q4pEIq
         zdrw==
X-Gm-Message-State: AOJu0Yzu8yi0oXkcdg5rQKUgLvOPu8WQnC7N3KAcbjz3/ws8B+uMt3zJ
	fhj/9qiwEofXqv1OFb1SZ88=
X-Google-Smtp-Source: AGHT+IEu83VeLmbxItdzge1PebvjhtesvuPRtx1ed6805HLV2vCqvUhityKO7eDYLDM8/B5u0VkurA==
X-Received: by 2002:a81:9a09:0:b0:5a7:aaac:2bce with SMTP id r9-20020a819a09000000b005a7aaac2bcemr18011138ywg.35.1697369250916;
        Sun, 15 Oct 2023 04:27:30 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id j189-20020a8192c6000000b005a23ab90366sm1326598ywg.11.2023.10.15.04.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:27:29 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 0/6] staging: rtl8192u: Mute checkpatch error
Date: Sun, 15 Oct 2023 12:24:46 +0100
Message-ID: <cover.1697367161.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20231015112446.cS9Lw1Jb2J1qnZBXHdEPjyYUDSS-rxuE7757vfn2aA4@z>

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Gilbert Adikankwu (6):
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments

 drivers/staging/rtl8192u/r8180_93cx6.c     |  4 ++--
 drivers/staging/rtl8192u/r8190_rtl8256.c   | 16 +++++++--------
 drivers/staging/rtl8192u/r8192U_core.c     | 20 +++++++++---------
 drivers/staging/rtl8192u/r8192U_dm.c       | 24 +++++++++++-----------
 drivers/staging/rtl8192u/r819xU_firmware.c |  4 ++--
 drivers/staging/rtl8192u/r819xU_phy.c      |  2 +-
 6 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.34.1

