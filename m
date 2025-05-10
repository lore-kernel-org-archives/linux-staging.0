Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE870805
	for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746897924; cv=none; b=etSqPbV2qZeU5dmGc5MH51H3Jb0no47L+RRPkzcgjGoQk/jU2+sjM6oS0Y9bPF9DUxMyFNgEB9bm4Q3srKC3ZfvsG+CyPX1Hfi6IsSFOAC2Ew1bzWcKM/w8GH5NgwrfNWwz70bW2xk73k+xA8B0ZaGitPVSmMPG4UQJYukanNfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746897924; c=relaxed/simple;
	bh=FzWBBt43Y383q4HfZDh5aYt5Cg1Cf53Vj02cyZIuy1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BWTRfCO+bn8pepy+EJSwyohyjsk6Iig/AZKbAC6PtGYm7rETAeyCN5VQdZHlw2vs114+FEVgrm6wL4IOw3QsYxI8Q4JdgDexbXSwxOG7VmWzQjBbY+D266jjpkm7ZLKp+KSpjflqZdjXQOqJjkW0NX+DK5PbBDShbgsX1byb0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1oE65VL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1oE65VL"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad243cdbe98so40395766b.0
        for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746897921; x=1747502721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppzCaZZulN4ybunhQ0SeSkauTMh7T4bUjJ7VwEDaceg=;
        b=G1oE65VLcGkZ5sN2pjX5PPapp4Ig0GjeEibK2gziYCFi43GuYJ4PtV4N3XZV4JgAaw
         JCBbha9ZPI3Ph2rtRt2oD7Si2rlC7RgjYh53NXbWaw4Ffq9w+fM0CwW7d9YBdGE2w9LJ
         MtS2dn9NmXi2NfoyN4svhA4gWBB++Cb82T5QN/tzhlw0o26cK/GNe7Aaqgv7yzu/du8k
         dnrXiwHPclmuUaJoydQE3yf6rsK5ZOchUh1xv8CLaQZnKZtwCf7B6dOb4OvHLtkA8jgA
         8cuPizQHdEHl7RCvYtaEGabpZtUkQdnETbiFBbSlRwE9w2P/Fk+Ff6fPooLzr80x02W8
         IIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746897921; x=1747502721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppzCaZZulN4ybunhQ0SeSkauTMh7T4bUjJ7VwEDaceg=;
        b=rAflM0Uo5ImKo5Hn6RCc4eh9vDbDhlgl4mEZHRo0jV7S6ve80m0zUDLp99q8zphlf4
         iFLMh7P911DOsdAUVxggMuAohcJTEhKglOCispMTrL8xBSVuxEae9+0QGWDudi+UH7Js
         bvfSbuChPXj7nlQ1kRSy67DInRoUwJXd8tjt3mkazR8HuOyT28jlPGvSXVDo/LrPwlNq
         MysJanWnJMDOYpgw89A7wAZbwHdxJeOvRnuthRV56+TNUj2JRrKqI0oPf6ZDZDvStkd3
         oOOALJDHwq7VXoXrNSzYUsWqqEpP2td/vxTh09VmEXk+6sdS+teIOOXA73JL9rgudSNx
         WuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXToq5owRVjSp8t+j44PojAENEBCx/ApRefyqL1THyrj+xTn4EnyGXi7J1IvMKxyVtmGxlECFa5K8lktbW5@lists.linux.dev
X-Gm-Message-State: AOJu0YyrgV7uiQGOWdFwy6643Jr3qO41qC4tOEkXnJdaH62FklyEyK0w
	Vkyhy9dZpAKaUCK6cJKQHiXkHX/xC6m92rRaGmsah4bemMxVpXeW
X-Gm-Gg: ASbGncs3ziNHG3hY7OL8yEi6GEAKu4e0uTIOmpoVqCdN0cR8P97DSYYbHDIjF7vkm4s
	D2MGLc5JLWqaeKv9LZ9UdkEwlZwu0SBDGWr4js4bT/Dp8vMA5mem08BN0EtDyLg0qQSQfolPkBc
	7AgkFSUtPm/+CHw8m5aEd8crULC6MaLBnhN1PAYTNtom3Rl1z3IrgWQWFz+EmBJ/YvWjmql/Ijc
	WSJKRBlyDRQ61VFM8aUsL0t8TYwaL8q+oUqrwIO6OlphRnflkdEGtlNc+98COpcXeMURWHYla1s
	6MHnQoFMYIxDR0UygAaBegHZ1Qh/fNzh7BN/5y+tU3yhVWDMv74lCet46ZY+3GulSPhAamGyh5Q
	AmpnB1wsvGw4nnuuimASoYi8U5Zh+OXQ1m3OBUtLriSDNkGKv4PObC5rj5QyA7t7SGugl77jZDU
	tk2wI21aQFiXw=
X-Google-Smtp-Source: AGHT+IH2jH92Ofi3qwYUF7/zNqhANG2Z7iCEB6Sturs5aIkxR5IsmC8vQqLvH8kQHxEPVsIVRFk8aQ==
X-Received: by 2002:a17:907:6a13:b0:ace:6f45:b5c6 with SMTP id a640c23a62f3a-ad218edd00cmr775048866b.22.1746897920527;
        Sat, 10 May 2025 10:25:20 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197465cdsm339717666b.115.2025.05.10.10.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 10:25:20 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH] Staging: gpib: iblib: iboffline check if board is in use
Date: Sat, 10 May 2025 19:24:20 +0200
Message-Id: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensures that a board cannot be taken offline while it's still in use.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/common/iblib.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index 7a44517464ab..0ab5680457ac 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -240,7 +240,6 @@ int ibonline(struct gpib_board *board)
 	return 0;
 }
 
-/* XXX need to make sure board is generally not in use (grab board lock?) */
 int iboffline(struct gpib_board *board)
 {
 	int retval;
@@ -250,6 +249,15 @@ int iboffline(struct gpib_board *board)
 	if (!board->interface)
 		return -ENODEV;
 
+	/* Ensure board is not in use */
+	if (mutex_lock_interruptible(&board->user_mutex))
+		return -ERESTARTSYS;
+
+	if (board->use_count > 0) {
+		mutex_unlock(&board->user_mutex);
+		return -EBUSY;
+	}
+
 	if (board->autospoll_task && !IS_ERR(board->autospoll_task)) {
 		retval = kthread_stop(board->autospoll_task);
 		if (retval)
@@ -262,6 +270,7 @@ int iboffline(struct gpib_board *board)
 	board->online = 0;
 	dev_dbg(board->gpib_dev, "board offline\n");
 
+	mutex_unlock(&board->user_mutex);
 	return 0;
 }
 
-- 
2.34.1

