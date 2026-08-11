Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D61330ACFB
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 01:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786411049; cv=none; b=lbfbP2p8uq6h7Bxx9QZBNKPzegeOLmaLUE5/JVNIV/hB+HX5ehisezL/qOtiM4aKUU0GEiaNX1trKSrEARoKRzBbYUtqOHThmKc+Pi+B8H6bT2bTrcu8As6PDvNx4XJq6aGMmf22yc4vr2ye2UMjifTpUnFe6bme2Zf1pkxYcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786411049; c=relaxed/simple;
	bh=VikHt54Ptc1U5+w3VcuMD6AVAjm4zUAmKq760HwXhjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gj8qpfy05ptgG7TkMOYSKK/t1b+cz7BjwNBfWPORQTMRazOPpiemM6Y4Wq0vD/dpkFemPz21iJq+xSmSsRY6OO5lFcZHoVW6Y2S8VTCVn6XCTPv4Y2Bu8G33sQ/OQHKUp9aCoCM6kFqCaCc7thaKOlnl39+qkHGjI1ibjYfuZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auHZtM5J; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auHZtM5J"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf49dc28ccso4226785ad.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 18:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786411048; x=1787015848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaU2aib2fka6g8K5mPVr/qx+AvcdUlKsiWM47P5rcKw=;
        b=auHZtM5Jwz7Xx+bHb0Bji2R48ecuNc6ohb3FxzuplOfj+ydji76QHKB+7DumhIylBx
         pGCMPViLbRw0QB4M3Olb+XK09b854DP5TFYEy+ejP8b7i/IUiHRTthAm4gDpcNcZkEC9
         ivmt/X8qHN1WciExVykfa6PL1I24eSldcjNLko61RLayK2Q+JBNm2cPRp1xCLniVvZU9
         zDiPELyda7irrGIcg+XPse4B99jofa3BfeT52D9jNS7SmycftFfU1sJZ7KRAOp1Oc9pF
         D4ojrhIU2rMyT7zrxe1/IABG5GbtELRWIQYtrhzCset9hRz3HbXMq7KoIi8IilgYxg+P
         mXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786411048; x=1787015848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaU2aib2fka6g8K5mPVr/qx+AvcdUlKsiWM47P5rcKw=;
        b=pjcEi8J4l2bNJ/9p6/sMUPVdQpfj1YF3pVCa1tzPKm9tuQNupQpdZvolCiQbkyvaaV
         cstAFeOHlj7fDmWX2gnOqBqskcGyrx6Rz1z4gVVmvhZT7ytCq/unRUKQjdT/AVTHeD4j
         HP4OL+ZL94XDryzwxynR+SfvbIWzQGYxlWnJUZJkZzp8rl9NchU2HmMtWwjQjolQbLjv
         rrpDeUVmRT7SeqsZIgSP1ZSQF9kcw33MNaqV9AMvm8bZPlkqfTlukMXryzjcQRQLIazT
         kYydkoSbIC+vnq8/ODXvJdwt6bGp5fViN9upnQX/z/Cd3+YH+riB36G3tqPgIiu6dqQ5
         JYLg==
X-Forwarded-Encrypted: i=1; AHgh+RrOQZh1DNEHO9MlZHXsJQOgk6B0FO0ru3Q+3EuuS2NdV0OnuJfmRvS2BXECh4RfuB9WuS+70KgoN++5BEcH@lists.linux.dev
X-Gm-Message-State: AOJu0Yz97ejHQ9EVD7SWUY6s1UZ5wFCQVbJk7Q8rvmg8VF+mmVo/iJT2
	+rLWRluR7aRu6Z1DL+rBqDzhS+nyKCY25kVP6nFJQeYSisX4DU+bRABr
X-Gm-Gg: AR+sD1081Ofn0wpjb+D7JQV6wcB9jfVgCEygmTGjUFOyWiSDIHVYZLFHdruT/sq+bqy
	87QN18b3bdihZ/fEC1P0YJRxKRPhKphROWyqHRcCtEAN1usqaAy3zV68h0FX4ogJdtHrn00pQcs
	1+UUEclegjht6/VuCNLWYz2xGB+gbba9Tcq8zzvir/0wr5mjYNUNSzNVlG0QawXprn7q3eAnUWI
	MDJZewS54GxiJHuXUIhQz4ab6xiiQR5KGzo5thy8v8lvsn0ci7dkRf5mkoEyrcCAxNiUr24W/bq
	n7IN9TMsb2fRxoa+sigLkac4GhosgpBMI7/7kC6jgeSnaUO5w0M2YJmRoM3y+RwOlSGRX72NeFV
	hGmzokXfY8Y6fHzrUU7uZQHZRGvJTpRaiGvlWc4sIXsgaH6o8Dthuf2V0QjqsKCbeYCq19WUanj
	WCHFvs9uNXOfqwtZStDgz1SSSEVN/yr8b0uXMJmwXybvXm1ybnlkNCyZ0A5pXreB6xuyqTZWbZ8
	TEs
X-Received: by 2002:a17:903:32c9:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d0caa4978fmr344731335ad.4.1786411047625;
        Mon, 10 Aug 2026 18:17:27 -0700 (PDT)
Received: from nixos.taile51c2e.ts.net ([122.161.243.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a706fsm46935750eec.8.2026.08.10.18.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:17:27 -0700 (PDT)
From: "Sidharth (Siddhi) Sharma" <wednisegit@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Sidharth (Siddhi) Sharma" <wednisegit@gmail.com>
Subject: [PATCH] media: staging/ipu7: return 0 for IPC messages that expect no response
Date: Tue, 11 Aug 2026 06:47:18 +0530
Message-ID: <20260811011718.274510-1-wednisegit@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu_buttress_ipc_send_msg() sends a command to the CSE and waits for the
send_complete completion, which the interrupt handler raises once the CSE
has executed the command. When a message does not ask for a response,
that completion is the whole story: the command went through, and the
caller should be told it succeeded.

The no-response path does the opposite. Right after the command completes
successfully it returns -EIO, turning a good send into an error. The IPU6
driver this code was derived from gets it right, since there the
no-response case simply moves on to the next message. This looks like a
slip made when the bulk loop was collapsed into a single-message helper.

Every caller today passes require_resp = true, so nothing is broken in
practice yet, but the return value is wrong and will trip up the first
no-response command that comes along. Return 0 instead.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Sidharth (Siddhi) Sharma <wednisegit@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-buttress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index 40c6c8473..8b57c7c1a 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -265,7 +265,7 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
 	}
 
 	if (!msg->require_resp) {
-		ret = -EIO;
+		ret = 0;
 		goto out;
 	}
 
-- 
2.55.0

