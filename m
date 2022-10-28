Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBAF15C81;
	Fri, 28 Oct 2022 23:25:45 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id o12so10607038lfq.9;
        Fri, 28 Oct 2022 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObN85DLQdgZMO86MzqaZ/TqagrT3Q9Ju5tvegmgHI0I=;
        b=hGXCSOI43CSIV//bKpLKBDXd0TEwH9iARtXBHF08sb/OcR1WyJB5RnsRo3JwH932Ol
         FjRRT8JuQq3/QebUDKWrKdjbrawXXp2b/NwpqUu0z4oW4Wzkn5beSAZA0HU+KFv83alC
         14Y038mtq8XFwZZ1MmxTFGT2BIA9HEzx9g4cZ8RklCMsBBTuCq1F2o15fWB3w42G1Txz
         9UVMLE1FrdpItFBdWADGHQ51oaaAu3bLTRko3oWODBlhM8yfWIJbcSCi05VLFo+HEWGu
         sLhfnkP9pGUHFKqQE+30CbriZPTzTqHUL6gUT1zFufPp62BZpestSZ5eBSsNqokh4g4J
         OvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObN85DLQdgZMO86MzqaZ/TqagrT3Q9Ju5tvegmgHI0I=;
        b=InET2L/CAvvuQPTYwORTKyqSuCV2JZDpvQFDBNT0Ze/XsgRm904gYtBQnX0Q/7TnME
         X+dx1G4sHKnR6Xa56IoslTcrvtuK34U3kO3O5EE0h4AyYwVYkl2wYlLhS3GBDDSpgVpD
         vHSKxDrE81fKYZLtj6Ln7e0OCcVRSxPWS7eggf/iHBelJYmkZa8roi4nTTxrZg29+Cn8
         Qu/kaL9tj1MGr+thF8CUbDTlYstRD+mIp89shEsX0WMaRwwxlL+RPPAuN/WPnRvclQSW
         SMzJ2ko+VPcz8EvpOc6XrZEERY/x/y22m++oXmBrlEbysUm/4jwE62Slm6C0R8dS00Po
         7S9Q==
X-Gm-Message-State: ACrzQf1bk8MKtwuyGwxO/WfhUvkpSChkow7DMpktJgbMw5kL4qzRkLbJ
	PLf/P01KAfpY3kfHbEgP6u4=
X-Google-Smtp-Source: AMsMyM4Cj8vBAkl20Tai+tm54e/GLpR4218t0++Xzv2afKKVlEFG0QkeeHHpUKDKGs+4qJxTybh1xw==
X-Received: by 2002:a05:6512:3a8e:b0:4a2:f42:148 with SMTP id q14-20020a0565123a8e00b004a20f420148mr589700lfu.343.1666999543760;
        Fri, 28 Oct 2022 16:25:43 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s2-20020a056512202200b0049aa20af00fsm7064lfs.21.2022.10.28.16.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:25:43 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v9 0/6] Checkpatch cleanup in rxtx.c
Date: Fri, 28 Oct 2022 23:23:21 +0000
Message-Id: <cover.1666995639.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v9: reorganized the changelog messages on this patch

v8: made commit messages clearer, unsuccessfuly

v7: made log messages less confusing

v6: fixed some errors on commit messages

v5: shortend changelog comments

v4: made some changes on the code

v3: fixed compilation errors

v2: tried fixing compilation erros unsuccessfuly

Tanjuate Brunostar (6):
  staging: vt6655: fix lines of code ending in a '('
  staging: vt6655: split long lines of code in s_uGetRTSCTSDuration
  staging: vt6655: split long lines of code in s_uFillDataHead
  staging: vt6655: split long lines of code in s_vGenerateTxParamete
  staging: vt6655: split long lines of code in some functions
  staging: vt6655: fix lines of code ending in a '('

 drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
 1 file changed, 324 insertions(+), 218 deletions(-)

-- 
2.34.1

