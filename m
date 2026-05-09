Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0D38B7AA
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778318851; cv=none; b=aT6sGCiKzxxN+SyAcwwqf6ZP3tRsNNaG8fMXrjKgoC9t0whnwERyXkiBkwvJ2ANuVM2Q6Ec7b7B7oHuPAM0AbqilHTlie7n9uhkS/eBKXtjosOKvpBVbKlavYzntG18Zq8uLhGUwETP/pnY1TrWZHu6a0GHbfWveHn8rE4yAdak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778318851; c=relaxed/simple;
	bh=lHIfUfoYldIKXo/UX6z7lcvZXFL6uzec1GWs/aBId0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niLj2CzM6CHGg8348SC8q2OrIPeNhIOErZhfk+RCpD6Ea2DMEJEBu2UN/1PD3PCySqtWkSl5vXLl7WiD4//xmtG6zh6KuFMpvHWOnNnzuf9EWlq4Sp4RLyLqEEBj12/pm8rBD+FapqjHNpmSqzHdGj8UOlDZh+V1AfxkKw0O1+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKTmJdX+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKTmJdX+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b458ca2296so18696065ad.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778318850; x=1778923650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fNKru4wcaLCJfeGMBIRpabwgz5gQjSTUlQZOu9/T4s=;
        b=YKTmJdX+11MM4uDOdnWT94JHDgUPcId8glvwA9H7yearVjsy0gwx4tn1yeizsMhjIB
         xjJm31qpykdoFWXms63bcZ6CmJYCQg/q3axnfUiwJsAWsFKIusagcQ062XxCcFoRs88i
         skdYgY+u2qHRhZAk7kTS7hG7CNMs0Pf8qES+mTL9UrsdS/q5xEdjt11ty7JomwlLX2U9
         SlxLFk4APKFV3DqmMDJ5O8xIHtrjH2TnkFJKammoOqeUa8xcm9a3owOuH8Rmi+DERwlM
         L9xXY03BFioR5Q+c+okIaHR2J8TPHVoJ5oWMEaQq0mKRgV1zDnZvqg5l1JCIIuqQL0q2
         HQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778318850; x=1778923650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fNKru4wcaLCJfeGMBIRpabwgz5gQjSTUlQZOu9/T4s=;
        b=VUKYb/PSKMhY6x7B/pqUXP2RLesIRDIUADLP+1dn5PGI+BGtNk6iDu0AxQCDyVR9pE
         KKMZc099ieD6eSIYe2g9rUOslND6hwDhbR5qrMctTKw95R1XMIbyxPAu6/xD8LmNo08q
         3s6a6v7UGCw1WpEn2PJV1mc3s8pBK7f22PU0VHpG+3bgNEYSUZUWINCwmK9oA8aj9A9o
         J0ukjwIHhLlQYQ0FufTJPkzBwnJ5gHc7D+e2dcDBB8CiMdKwEn5LCv4HPoKoHVmtvjkS
         e+F+juOR0WaWGHAZ/2GDDTIz2Ox1Tw3/zK50AL7EBlF4gIp+TCbxJcg14mLoOAhEEioM
         805g==
X-Gm-Message-State: AOJu0YxqL0b4KaWmTGoF8IypRtg4YxfdipZSziThG8DILHhAYZ5fnLv4
	Ta+hgDuBzIJUWmuLhUHzKBDaR6o7ZfgpzMD/X464vBG0I/WP/uC6I11biOZfvg==
X-Gm-Gg: Acq92OEsx07/3y5yq9Qi6gWE7vcJbQd1aJ9hzNQmTQ0g8y8oaRgd1xTvtVbwwQFCQtH
	i3zGw8TpwSJ4N+vwSX1V9yKwvW2iWb85SlhQid726UQwKeY3UY1iHWaxT67xX1dMtewywP5r1NL
	RDUfaOl1k/4qOuyH9Vkmtotu0Vg1v2uVqjBJBVQdfziC6pkBTSfvoFCWzn/z+V8sEvTNy14A231
	1qMmVNJKIlxXvJDs+hbfQpeCTQla8FChsNU/rx53F6+J1qRNW7VfnqDD6qQqiKssVqwFzSjJCU3
	9cJZWFLwW3Msavq8MYSfSP7UDkiURbK504y+1axwBpC2iE51ND29iSyBPwGw8Qf9l6VaXXuQzPb
	ku1/q/22tox6dPqqKhmt5D7i2z57NUYeSwcJg8hiB8h9TPzs1LfTtCXh/hlRppriquyaFHYLIEV
	jFLdHIKz9WEJnmCjhksuTAEJjppG5U1KuFzFFKMxfGvNUf2nJYN2A72q/mV0LgRw==
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr70808065ad.4.1778318849521;
        Sat, 09 May 2026 02:27:29 -0700 (PDT)
Received: from PC.localdomain (softbank060090219114.bbtec.net. [60.90.219.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36596sm47463105ad.48.2026.05.09.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:27:29 -0700 (PDT)
From: Rion Kiguchi <kiguchi.r.sec@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Rion Kiguchi <kiguchi.r.sec@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] staging: vme_user: validate slave window size against buffer size
Date: Sat,  9 May 2026 18:26:27 +0900
Message-ID: <20260509092627.1136357-1-kiguchi.r.sec@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026050935-designing-glancing-2e16@gregkh>
References: <2026050935-designing-glancing-2e16@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VME_SET_SLAVE ioctl in drivers/staging/vme_user/vme_user.c accepts
a user-controlled slave.size and forwards it to vme_slave_set() without
comparing it against image[minor].size_buf. The slave-image kernel
buffer is allocated at probe time with a fixed size of PCI_BUF_SIZE
(0x20000 / 128 KiB), but the configured VME window size can be made
much larger via the ioctl.

The subsequent read() / write() handlers (vme_user_read /
vme_user_write) clamp the I/O range against vme_get_size(), which
returns the size the bridge driver has programmed for the window
(i.e. the attacker-supplied slave.size). vme_get_size() does not
consult size_buf, so an oversized window passes the existing bounds
checks, and buffer_to_user() / buffer_from_user() then index
image[minor].kern_buf with offsets beyond the actual allocation.

Result: a local user with read/write access to /dev/bus/vme/s* can
trigger out-of-bounds read and write of the kernel slab adjacent to
the slave-image buffer.

Fix: reject slave.size > size_buf in the VME_SET_SLAVE handler.
With this check in place, the existing bounds checks in
vme_user_read() / vme_user_write() against vme_get_size() are
sufficient to prevent OOB access; no additional checks in
buffer_to_user() / buffer_from_user() are needed.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Rion Kiguchi <kiguchi.r.sec@gmail.com>
---
Changes in v3:
 - Drop redundant checks in buffer_to_user() / buffer_from_user();
   the existing vme_get_size()-based bounds checks in vme_user_read()
   / vme_user_write() are sufficient once VME_SET_SLAVE rejects
   oversized windows (Greg's review feedback)
 - Reword commit message to explain why vme_get_size() does not
   already catch this

Changes in v2:
 - Use git send-email instead of Gmail web compose (v1 corrupted
   the diff)
 - Drop redundant Reported-by tag (author == reporter)
 - Add Assisted-by tag per Documentation/process/coding-assistants.rst

 drivers/staging/vme_user/vme_user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6..64e95b026 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -394,6 +394,14 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
 				return -EFAULT;
 			}
 
+			/*
+			 * Reject window sizes larger than the kernel buffer
+			 * allocated at probe time, otherwise subsequent
+			 * read/write would access memory beyond kern_buf.
+			 */
+			if (slave.size > image[minor].size_buf)
+				return -EINVAL;
+
 			/* XXX	We do not want to push aspace, cycle and width
 			 *	to userspace as they are
 			 */
@@ -401,7 +409,7 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
 				slave.enable, slave.vme_addr, slave.size,
 				image[minor].pci_buf, slave.aspace,
 				slave.cycle);
-
+				
 			break;
 		}
 		break;
-- 
2.43.0

