Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77552E637
	for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gcs7Sv+R"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d47bb467a9so2371308b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 11:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703274054; x=1703878854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgevCgufJPPvCi62nf9pb7fjA62h0EtwHE1dYgT7BS8=;
        b=Gcs7Sv+RoVvLeRLGwOOg8+qseAoBC9jXCQ6UnKHkBoWt4/AvRtVFsgkeoJhZzu/E5U
         WME+KThnLVvH2RnzXgYHVvUM/CdPeUqDqZNsOXMocsXUSohpTfqLcsiya50rV66DAuPt
         pbmuFPrybbOHEpPQivL5ExY7NEslaVuSG32nAo0DJnAxDUIIYNqACFNPNqfWKVpg3ihf
         VZE87SFr9KxfwtQCff0Q9qqjNbzppnyWHqLNaQ5EUDkVphW2mLc1zzTvBW6oLI1hdsXs
         Cws++qZaTiDwqNllrfsbeEbJ0vTcdY/rI9dTam3fUpMWxwIgZdAANg02ry7uXn8vGvbQ
         n1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703274054; x=1703878854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgevCgufJPPvCi62nf9pb7fjA62h0EtwHE1dYgT7BS8=;
        b=KleXZpJmy5Q1bcsgiXVPlZEGYbL+1rogz0d7vRb6rSUwiv+SAI87GJG8IFp9BPsokC
         3h6Ce5jgJA/sDAuuR/HvKzshtWzYzJiMP9c93LHSu+EKpfIlphNuQYpXuQ3P47X/61oJ
         df8+USETlLbT8V8yu2mZ6Gu1bHn3bF4olT9bAJYJfJR1dFAiA4FsObfh4w5KqFdpA58E
         IoyogsKECFj/F3AiD15CBULmIqjX/KC6oMyXGQaxhgn3K4hB7XhiFBcenXWZzy06wS9P
         lcHZr8GqFqiSmHXCqutHh6llCP1FsvrXUcmxeM5SZLwUO+WtLnMTIW3E5OxCo+pOBWfC
         sD0w==
X-Gm-Message-State: AOJu0YyeosTobALODUZXVdraLU4dELwGQZJ6t1jw4xDFcfVizegMUSx8
	UCm9VXvc/SedowBGLBQ8KX4=
X-Google-Smtp-Source: AGHT+IEChco+TUdIxGydxRNJBv8sAOqipeg8/E4HlGZdHD5+cDoRWB0XW8k9CliFNZgR0E964Cc1mw==
X-Received: by 2002:a05:6a20:7287:b0:190:38cf:15b5 with SMTP id o7-20020a056a20728700b0019038cf15b5mr3663674pzk.20.1703274054099;
        Fri, 22 Dec 2023 11:40:54 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id h24-20020a631218000000b005c6746620cfsm3630831pgl.51.2023.12.22.11.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 11:40:53 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media: atomisp: pci: isp2400_input_system_public.h
Date: Fri, 22 Dec 2023 19:40:35 +0000
Message-Id: <20231222194036.1984-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported repeadted
word 'of' in isp2400_input_system_public.h
as below:

'''
WARNING: Possible repeated word: 'of'
/*! Read from a control register PORT[port_ID] of of RECEIVER[ID]
'''

This patch removes one 'of'.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/isp2400_input_system_public.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 447c7c5c55a1..523c948923f3 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -163,7 +163,7 @@ STORAGE_CLASS_INPUT_SYSTEM_H void receiver_port_reg_store(
     const hrt_address			reg,
     const hrt_data				value);
 
-/*! Read from a control register PORT[port_ID] of of RECEIVER[ID]
+/*! Read from a control register PORT[port_ID] of RECEIVER[ID]
 
  \param	ID[in]				RECEIVER identifier
  \param	port_ID[in]			mipi PORT identifier
-- 
2.34.1

