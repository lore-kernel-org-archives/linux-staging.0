Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB01CA92
	for <linux-staging@lists.linux.dev>; Sun,  5 May 2024 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714915435; cv=none; b=soX/BYnUrhQD5ZOvXMO/zw3p1Xig2lDzgVYIKprHJnVULPG55obqsn6meuQJIZyI0iXaQCX8NZLkqP2RwAA69EcDEy+j1s4+gCGZEYPDqyr6BDnkjZgX+BeHN7G5rAGJTBJaBU6U3BsghPn5fbIMrB5+GKChvUmAeoKhhtRlDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714915435; c=relaxed/simple;
	bh=RZBU9BLwoMqxabCjuE4NgICjeuHsBhDACgoIfR0UVsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RWPs/qfmzbMjd+zhWSODyLkN2ZlchSGoGzVANRs3QrGKkTMQEPtHwalKtr+3/UQ56h3auQ0Csc5HLyOjUJ7nAIpx58arNIt8gnl19YiHRQnRIyV2V8OXEMkI3FJZm6j8eVvqr21PDXl7RxhKMNNSg1M7cXFl6gRUBln2ALsTdnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuieSugk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuieSugk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1eab16dcfd8so6621165ad.0
        for <linux-staging@lists.linux.dev>; Sun, 05 May 2024 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714915433; x=1715520233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mc0FzHEhUeqDsgURvEW8MExped5cfDIKcyo64gW0V3A=;
        b=OuieSugk4TgVHX0x2CPZuc7uhYCF7u9z32+N/TD18/xssfhKLF7VZZMs+9G1zHn2wf
         yK0tZmJFGQo4ckLiZkgS5ltvml6U82Cx6jzNh+wOfT8O2JbD3fpPaVXAzwPfbDeEl9k3
         jFfh/CvK/FfUuZj7Ui1psTMurvWuWwNN17HbhC67IM3N3Ss+EYg3MfYo+dGC/sfSa7yT
         kSVjog+8oykx3zXCSnfK0j4CFetuLTan4r624rpzmnAS7qdhgAyTkHcjeWUcpdVW7Gjr
         3DMSIo5OZfFQF5KRSeqb0Uqo2Ovw1jqi3TknEuOyUvo++ElZIrpPWd278/w1PVzYU4Zs
         aSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714915433; x=1715520233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc0FzHEhUeqDsgURvEW8MExped5cfDIKcyo64gW0V3A=;
        b=xM4Eu3EfNo4I/LFCjWq2ej67q2aHi1g+qyMVJcoUy5CQ48pKAENdH0KVY7kWSKfj7U
         cunonhKHAath7iQ9v8MsgrfiVLrzCGEwMidct/cZelHNLjFLTrKdD7OQWC+LEo8wom3R
         uOuV7f/uzENXDdVC4wB0BB6bZCypw7TpUk20VllPLIIX/RsAqnZBeHtrfIuGrBD/umob
         YWqXbFAdOJP6TOvZlfLjmNf7jvrcacRx0cCNwdV+yewWbFE1KOcqxucEPJiwZsqmtdot
         XwVZhULL0nwBBrwtPre/WPwWvluHWyGe/JUG2NFXjmyyhg9TEJ6oL9CnXTxKijsk6Sru
         Z+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXyCLMud+DvjST9W86xTiLSs/i+A3s5ha3F8l5wJ4Y8fQ8F0rhCmIFgEr+ruU7b5d8jx2/oMk0IykwwL05dcIEii2iCkHswK5dUisS0fw==
X-Gm-Message-State: AOJu0YyGKO3dq4/2KfbXRfzGWL33momzCFnhKBVMvNeOTAkPwIf54bsn
	e9QdJ+0JqbysDGJq8BXgTd/QTo/RkjY63H0Muz9Bl1YMJ+XJ/OMB
X-Google-Smtp-Source: AGHT+IERzKT6ecipwoJu1Z+lrbemytWDosmvEMrqC5CfWS5gLeUzk4VxGRn1IuPLY4snAEp9Aa/hYw==
X-Received: by 2002:a17:902:64c2:b0:1dd:2eed:52a5 with SMTP id y2-20020a17090264c200b001dd2eed52a5mr6903295pli.37.1714915433499;
        Sun, 05 May 2024 06:23:53 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001ec4ed47ddesm6511645plb.86.2024.05.05.06.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 06:23:53 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in hmm_bo.c
Date: Sun,  5 May 2024 19:08:44 +0545
Message-Id: <20240505132345.135528-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled unchanged in hmm_bo.c at two places.
This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 095cd0ba8c21..b90efac771e2 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -288,7 +288,7 @@ static void __bo_take_off_handling(struct hmm_buffer_object *bo)
 		/* 3. when bo->prev != NULL && bo->next == NULL, bo is not a rbtree
 		 *	node, bo is the last element of the linked list after rbtree
 		 *	node, to take off this bo, we just need set the "prev/next"
-		 *	pointers to NULL, the free rbtree stays unchaged
+		 *	pointers to NULL, the free rbtree stays unchanged
 		 */
 	} else if (bo->prev && !bo->next) {
 		bo->prev->next = NULL;
@@ -296,7 +296,7 @@ static void __bo_take_off_handling(struct hmm_buffer_object *bo)
 		/* 4. when bo->prev != NULL && bo->next != NULL ,bo is not a rbtree
 		 *	node, bo is in the middle of the linked list after rbtree node,
 		 *	to take off this bo, we just set take the "prev/next" pointers
-		 *	to NULL, the free rbtree stays unchaged
+		 *	to NULL, the free rbtree stays unchanged
 		 */
 	} else if (bo->prev && bo->next) {
 		bo->next->prev = bo->prev;
-- 
2.34.1

