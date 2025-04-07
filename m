Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0179221555;
	Mon,  7 Apr 2025 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062842; cv=none; b=W6j0fEkdpdodZ0sFqXUZXmU+lkDtDO6ue59PybsAOgJ+S3FDZfVHVLbi1e7V08GUgdxADkT2mjFaTuFsLOApLs2fuHpbtXlpmpD9QPzZk39DoGGc7ZGgJvCFE1A/YemGjP2jlJEnnT4bt5fKs3yPvKa+ip30xiSAorv6icnevUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062842; c=relaxed/simple;
	bh=7sSgdbwii/FC6PRsh43qxcZ62ba0Ps9U4rALssUwWQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uclMTct7ZsI1aIWWyApIWAXLLwvHK8irgYX9oSjaRw0/XADCmzbg+X/fzyFBTELyPo1ax7K4xQxdHgVHsu9vVgQIpW9Pf5Fj3TuZw5g1sei0KpVsPM7Yj2QqxQG+Fu2N97jxL+y/acFDqz1AL5Pj5rmtIfONV0KgJAekKNv+AhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aH7Gbbq6; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aH7Gbbq6"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5b2472969so489934385a.1;
        Mon, 07 Apr 2025 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744062839; x=1744667639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44ptuqfm+xZfFiz36ZupXaHXqHCUTI9Og8HwmPEzO9A=;
        b=aH7Gbbq6ofc9EtTU8HS0B3NjqK2uRrc6kTNWKEGgj7YZEiIdLTPgVoO4KWl6HIoCog
         ckM9F1BfjUMgfypS3tzpWTSP91/eIaHgYbY56EEjUrnZPgjErp5uC6li9Cqy2KpeYF4Y
         MGYbAixLPHvwT+NRVIMkSohLVzDXq4Q8J/uc+flj+w8RMMYlBG2Nmb4EAxwWJxp5f7yw
         Fotv2MuWKjtvTA9jg6jENO+C1K8imMS20rZIRl7FYsF4XO6L/CBm/lEfWVVtoOhmX/oc
         9YzL4OTH4C3v+G0DdR51f+IbkfeTKvrk1cMgESiDibjEr2POdYWxEsqnkDJjI1GrV+6q
         PRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744062839; x=1744667639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44ptuqfm+xZfFiz36ZupXaHXqHCUTI9Og8HwmPEzO9A=;
        b=WCmdAwAFYyQ7yXkdGZz5O8NxpmrnxF7sU+yHidUmNN8+5lMy1UOaMiGjiA7fiJFMVU
         8zEDu29p6BdePGEBpJNiHkvHtCw47ftDN9yUMS7WuNg6rFah9hKqemtzDRV3NfuBPYTE
         wVBaB/sy6yYIXuDk+9C9Yj/VfCPDKxiRv1w1PDu8iIzQGqGqw7pAwH7nrtn3gpaItlBH
         bvaFsD/LsRgYbIDHQXqAP0fj8iyvSFwvFSykHGlVeVCgSbLSctIFGYdRDkOBCCJyLxyJ
         kbqjaXeP3FSXs6BJjqK+dAESKPsrvRBzDGOGZZvxyBs918Ic+gEoMk2gJcnFsULS4DK1
         4J0w==
X-Gm-Message-State: AOJu0YzmAr6AllhWR7zKVVsH7bGiRYOd/uuiIybComUTMBWIBauUuyt+
	okGDJ4fqztZmAkd2T7g1Qvs9Lnh8bSSOomQvbg2P5zD/V//hLb8G
X-Gm-Gg: ASbGncvEl1R+QREDhbg3rSj/TclgpEW9zWUtYHOY3+dwHuSo3Fwce7bfQUVx/Knm7Bf
	e8U98bVgprSD+tNtCGb8Zad52j3mtFuewErUhIcikRL7UKq+VraVY8veEHHeCaYgQGv6bIA3y2K
	imjxwWrg+9beURVA8kjRYbT7QkhUPzyciHkvVupFqvOerQ8eD61bUJG0UYYyqhCxsUpJWq3V2fC
	FfdIp+VL9pg7sKSIm8NVC00xcCIqSGkCLe/LHZq7ktT0UorptdJuEJv2qM+uevGu+flv8UzTZEZ
	BeMHNqXSTvbh27b0UmSPx5+pUSFaC6mS8WpTJFDgF1oF9OpPFOwSQDOiawFr
X-Google-Smtp-Source: AGHT+IFYq9jV/RIkb/tm8Itj5vUw+kwBbaTvoDn1s/JrUJSvmRAIKF301twccpzuKSqt5xla9PcLtw==
X-Received: by 2002:a05:620a:4409:b0:7c5:5584:dc1b with SMTP id af79cd13be357-7c77ddde0f5mr2114746085a.54.1744062839647;
        Mon, 07 Apr 2025 14:53:59 -0700 (PDT)
Received: from ubuntu ([105.112.230.142])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea7fd73sm653687485a.95.2025.04.07.14.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 14:53:59 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org,
	julia.lawall@inria.fr
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	andy@kernel.org,
	dan.carpenter@linaro.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Mon,  7 Apr 2025 21:53:50 +0000
Message-Id: <cover.1744061673.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tha patchset adds spaces around binary operators and also
provides clarity on sequence number wrapping by using a modulo operation
% 4096u, in place of the bitwise AND(&) operation & 0xfff.
The patches are required to be applied in sequence.

Changes in v5:
	- Converted the patch with the subject "Use % 4096 instead of & 0xfff"
	  patch to a patchset.
	- Added a patch to add spaces around binary operator.
Changes in v4:
	- Corrected patch to use '%' instead of '&'.
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Add white spaces around binary operators
  staging: rtl8723bs: Use % 4096u instead of & 0xfff

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1

