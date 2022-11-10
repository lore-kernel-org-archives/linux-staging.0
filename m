Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576E36C
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 10:35:15 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q9so1611452pfg.5
        for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3Q7nb8mm+ugLVzloAAiV50ng5cZIeUMUq76G09WJLk=;
        b=q5m/uzQtlXopPz22JGqRLCwTsoFo8Onjnu3D8x85brI1dVXfJsXtDYK8FnBr75mQc3
         tq0msAAXAMtBqzgy33CAnpGWi1dO//tm54+YrpebUcBmrze2hM0T3DGUVJbdE2LtGkQ9
         01JszW80SllVVTycHMhWUmCa3aDpJZ2ol22jDNm2j5M1BNYlvb6Kd4LC9mrH8bm1OG6d
         rkgSgjB4W7ec7aVd3KbV5BO8FtBfIcnjbO3XEHEYbXnfVRFUMHHTqRohXMxs84r87a9d
         FTTGBKheccvC4LZ5We+cmxAUB8pXN5aq6yLy2ZLfeAQw+IqhUD9khzxI+EoMuyBkE/l9
         Lpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3Q7nb8mm+ugLVzloAAiV50ng5cZIeUMUq76G09WJLk=;
        b=ChfIzt6H3VoL08x01egeSTdVGBw0Ga7LLUybrwt3rKzSfByup1ROIlxS8Z/1Cx6e6r
         6QNPwojoonRMJdbU5AyaRN1f6fKKXL+Oth17ZC6PAK8ukT2esxiOkrsUlyZpsqEmTHPn
         GR7TwhcaU02KpaLCcdq9/jU5qZUCQwdwkhqasWytYmK0tHUwaSjb10UMoU5C+vdD4PuN
         p9XrjWJ53wW2AcNo4R12cs3bPqbBn2OfB2VOC36G2lXFPHHo6dcPlbofTF1oYdDfjReS
         VqQVO5fUIQssi8qyENZ/uxkGMFRDUD5ri9rMfmWbYYApYJZP66NsgQ/0cpDS6pi6Hmqu
         DQhA==
X-Gm-Message-State: ACrzQf2PGtcW/t+biaCWDd0ctetSKaGxU1zq0UgSXn1m8n3efguLVI/e
	B8zieiCbiV61SxxXSXfzHMM=
X-Google-Smtp-Source: AMsMyM4YYNLLV7RC23uv9W6O2WIX45qsDfRsqeNXK/q1WMby+UvLYqkFLYzjPQJ39G8w3Amr42d+aA==
X-Received: by 2002:a05:6a00:4c0e:b0:56b:a80f:38d4 with SMTP id ea14-20020a056a004c0e00b0056ba80f38d4mr2344226pfb.12.1668076515331;
        Thu, 10 Nov 2022 02:35:15 -0800 (PST)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id j16-20020a17090a589000b00210c84b8ae5sm2776227pji.35.2022.11.10.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:35:14 -0800 (PST)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] staging: rtl8192e: trivial code cleanup patches
Date: Thu, 10 Nov 2022 21:35:09 +1100
Message-Id: <cover.1668075486.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove macro defines and rename few variables to make it align with other
rtlwifi drivers.
The patches are required to be applied in sequence.

Changes in v5:
	1. Removed original Patch 2, which is renaming file r8192E_firmware.c
to table.c, as it's not required at this stage. Feedback from
gregkh@linuxfoundation.org.
	2. Put more details on the description of Patches.
	3. Put more details on the changelogs.

Changes in v4:
	1. Missing patch set vision number in the v3

Changes in v3:
	1. Patch 3: use ARRAY_SIZE() to initialize variables to replace 
macro defines. Feedback from joe@perches.com

Changes in v2:
	1. Patch 2: modify r8192E_firmware.c to include table.h instead of
r8192E_hwimg.h.

Jacob Bai (2):
  staging: rtl8192e: rename tables in r8192e_hwimg.c
  staging: rtl8192e: replace macro defines with variables

 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.c  | 31 ++++++++++------
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 36 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -----------
 3 files changed, 38 insertions(+), 49 deletions(-)

-- 
2.34.1

