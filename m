Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6952C98
	for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 07:37:14 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id k26so5675702pfi.5
        for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 00:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P+5ziw6NsyhF53DNCK8sntvKXOSlWURctQDb8KvB3dQ=;
        b=m9lRHPRyDfHhdaCjSgkwRrfTDVO1ixInKtfSwv2eH2tCgk8kmaAzxnUlw8xzYdYBZu
         eMMkbLD0EZRIgWK9IeZSfPWMM8wKV1XGYot0HLPpP3AFny7nCR3ZggzUKy9x4K4MJoel
         LxB3+xCZKSIpsNiDTmx2A5TupFhUDD37tjNJe51qP9tR0V38mLjHbIPkC+wPGy2OdoW/
         wRjSbIZhWmsTsIVnA4lEdOHGLTV4Brg9aTmDPYoHzLs5SoxiLhCjLNQ4jLAgoEfCvXpv
         qH+tWIYM6NxwAcNA6lfZS3dTYW8SNbraPmN6sd7+VDgTzH1WtaMTa/1AzblWZAjiJkOt
         8lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P+5ziw6NsyhF53DNCK8sntvKXOSlWURctQDb8KvB3dQ=;
        b=62YZX1UVlllyRAA3ZK9md4xKAOFMP65uXieXZtD+OJxi43L5lNVDgkJ3G6Qr6RHEqQ
         wnsU6htVQCzhl2yplnDQsFoFE5/gJckbsN1VZeGeR9nuNq//ZrBU9jZohJXmB9nw0eRW
         L/tqbBAC18chOGet3bY9uUZObYAK+ALDUvtEqW8nyp4exmzATQ6XeL/Yl5gdZ/TV7lZs
         JptVvnI3uOJ44AUMUjnpEpo2xHQfCDzsJkDHiAOo4s28nn4Hdqgy2MAJhLxbPO2VA8dr
         JJefdXeRW1bpfgLiEEPR6cfVYNOFmluLpjckfDmud8qO4Qu7cFCXkDYPTR53SCTNhRza
         Wb7g==
X-Gm-Message-State: AOAM532qUd6gX6cDYZxty4/9S5LX4fW6qwzNTQIOH4ZmTIQjaKXjxSHI
	nuaO4JTsC4oy9n2JOUtIW2s=
X-Google-Smtp-Source: ABdhPJw1Q+E8/yFh/Fk+CPb15rQs05FtKFPhSb44WTtKV8+iCQA2zVaPxNJ11FLf+RkpfZW5PD+XOg==
X-Received: by 2002:a05:6a00:1148:b0:47b:c0c6:75da with SMTP id b8-20020a056a00114800b0047bc0c675damr3649320pfm.61.1634974633691;
        Sat, 23 Oct 2021 00:37:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:5173:67c9:d8e4:2819:8ee8:8de4])
        by smtp.googlemail.com with ESMTPSA id c4sm13949791pfv.144.2021.10.23.00.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 00:37:13 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kushalkothari285@gmail.com,
	kush19992810@gmail.com,
	outreachy-kernel@googlegroups.com,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	fmdefrancesco@gmail.com,
	marcocesati@gmail.com,
	straube.linux@gmail.com,
	philippesdixon@gmail.com,
	manuelpalenzuelamerino@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mike.rapoport@gmail.com,
	kushalkotharitest@googlegroups.com
Subject: [PATCH v4 0/4] staging: rtl8723bs: core: Cleanup patchset for style issues in rtw_cmd.c
Date: Sat, 23 Oct 2021 13:05:46 +0530
Message-Id: <cover.1634967010.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches make changes to clean up style issues identified
by checkpatch.

Kushal Kothari (4):
  staging: rtl8723bs: core: Remove true and false comparison
  staging: rtl8723bs: core: Remove unnecessary parentheses
  staging: rtl8723bs: core: Remove unnecessary space after a cast
  staging: rtl8723bs: core: Remove unnecessary blank lines

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 94 +++++++++---------------
 1 file changed, 34 insertions(+), 60 deletions(-)

-- 
2.25.1

Changes in v4:
move version notes below the cutoff

Changes in v3:
Enclose the version number inside the square bracket in the subject.

Changes in v2:
[PATCH 1/4]: Moved unnecessary parentheses change in PATCH 2/4
[PATCH 2/4]: Added the extra parentheses change from PATCH 1/4 here.
[PATCH 3/4]: No Changes
[PATCH 4/4]: Fix whitespace error.

