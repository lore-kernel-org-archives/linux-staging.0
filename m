Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BC0B67E
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 00:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017089; cv=none; b=G9EAzngUKOuc+e4OQl+2cFTPXITwVzBbHjuRLOpOeX75JpZfFCqE9EJZF1rxe9LcDLeq46+zDR7zlT6WkyQybeSFlOFH6UzAQwO+VQ68+7JqpNFWB3arZKSZcF6RctNbqhoEba/mziN4Ub4TteVWk6YnN80Ej0rhSqbnjAXVjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017089; c=relaxed/simple;
	bh=yPqdlvnKnzCRuv6bL0sORdjSuTcolZbCh20G5Lg1ldk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HCwlvcJuM7dqNpTGnyhoJvcHAe2S8D+D312ZJgAC0CNgtIJ+YMGkM5v0gKqPQ0pp1dXtsXlCqNPAID9d6Z+x1v9lu0vK8Fob0kqEjiDVmvqudH196WUq74qBrlCJ5Ig8GEFY7rtIDq2rjleTu+WrxQ1XlF5brigOZXSfE0Layjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bu8FH/Hn; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bu8FH/Hn"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94acb3d6cceso6336658241.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 17:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017087; x=1773621887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFBnFajj9DeAcD6WgwkEBoJsTvDSTyx6+VqcTzPcpVs=;
        b=Bu8FH/HnVyrgQh8oIn62Q0E+TW3n7wi4CKLq82M0dhxAITTsI5aSm78Y+PVPaOEHwO
         lF/M67SoZZpcCZ/jXP4UUt5YwspG5hkstR/kJugHwl3a75OhngG7rnikvSy0C7XfS1sj
         5KII4Nwg17cnIWXwsSAGV2ZMylhaZTO8k8GPk8uAjGbbovDpH1aTg8zaUziNpueX5jFO
         +f7oouBdGPwi6n3/ttrX+r5mNsutB256M9M/tj8giGZbdGY/y5c2vmlJNeQ7LWK3xKab
         Mwz431k6K2raYmKS7VC9VLHq3ngf33l4QFPUz/gA9Cm6qijxfv09REV7CqCpwBlF1raj
         06WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017087; x=1773621887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFBnFajj9DeAcD6WgwkEBoJsTvDSTyx6+VqcTzPcpVs=;
        b=gi3n4TtN0oDC7Z7E592kpL6kWrCKnu38qzktlS/JA3I+HMr6gKFRAgD083dafLxSmp
         Q+7RGGMYBlF2RqfDpnZCkQ6jA0LJ30zl8tk2fwRkoVmdPX2sxTwPh04U/HGuOQY5EAj2
         aze/uynDqBo0wDxKXgaGxB1XHrzGs/XlH7w4f1leujQJzYzDVkudurYPHd8tseL3pPH9
         eRuMtwz3K7dN7UT6fak3R/7eNf7mrA5XfFt2vI4eZRlG+41wFRL+VVufxr/j87cMPQdb
         HWJzimB0EGaNCkscTPZi+A/fW1AqnB8LPH2kXJG8WkuJ4VKKe5fnfq3t6anB9ry/o8U2
         0elw==
X-Forwarded-Encrypted: i=1; AJvYcCXdJItFqgjaXzD97YjGBriXjIiV0Pl1IT4p7vwcVB0FlcRMhA0BRm/HIZsEX/w8fgjXRf14z0LVLg3wJiRs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0AkOzaHPm9ZbLgKO6ZjwPge/Cn+1H+iWLTl5GvkSHSyqiXFz7
	XSZ3r4YqwxOD4S1i6Y9qkyrojAa01WKocyyqHlHbAev9L8NEbeGTHidi
X-Gm-Gg: ATEYQzxEkY2J1HF3UJIf7Ri84TgXnnJiIgVJqHtMIOHeMxQDh6sZQM176aSHmE7q0Ze
	XyMZB34HxaIXZKF4dPkclEy3Rrvd3ZUUtvOUen7Xxv+y7S11gJAZ1RyfZHLanrtJ/KySNik9qPJ
	m1EwExoD1vLl08tYUJqp/AanmLPiHlC6Aeb3bqo+H9lgEpyR5UoUgSXc69yA09FlL5PY8mL5Vil
	Upbau+x/QxnjbIDlXhleEdkKQylxZ+2dTR7IALvEgCq1WZbaw6dKI6NsXf2u2xjr55fD0bV+EqY
	Lxrs5xXpRtbTlnknAgz1KdmEg6K1IuSRKfPHxivFm87Vwce/AZMrtzc8ZZQQZ/haxQ4d+oUdoYU
	98FBj7ZQ+C/1d92xwKYMHUubc+85Ny6cwl0UHmdM1LyZKvNkv3LFOteLAxBP/g/6WKosMbqQNY+
	DflMHYFkM4R+K2eLaL/ZOEZOL/
X-Received: by 2002:a05:6102:1624:b0:5db:d6dd:81c6 with SMTP id ada2fe7eead31-5ffe5fb636emr3958903137.18.1773017086790;
        Sun, 08 Mar 2026 17:44:46 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ea681505csm1080603241.4.2026.03.08.17.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:44:46 -0700 (PDT)
From: sluisr <luistermc789@gmail.com>
X-Google-Original-From: sluisr <contact@sluisr.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sluisr <contact@sluisr.com>
Subject: [PATCH] staging: greybus: loopback: remove unused macro argument
Date: Sun,  8 Mar 2026 18:44:44 -0600
Message-ID: <20260309004444.20283-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the checkpatch.pl warning:
WARNING: Argument 'conn' is not used in function-like macro

The gb_dev_loopback_ro_attr macro accepted a 'conn' argument which was
never used in its expansion. The argument was removed from the macro
definition and its invocation.

Signed-off-by: sluisr <contact@sluisr.com>
---
 drivers/staging/greybus/loopback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0..855d5051c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
 }									\
 static DEVICE_ATTR_RW(field)
 
-#define gb_dev_loopback_ro_attr(field, conn)				\
+#define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
@@ -305,7 +305,7 @@ gb_dev_loopback_rw_attr(us_wait, d);
 /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
 gb_dev_loopback_rw_attr(iteration_max, u);
 /* The current index of the for (i = 0; i < iteration_max; i++) loop */
-gb_dev_loopback_ro_attr(iteration_count, false);
+gb_dev_loopback_ro_attr(iteration_count);
 /* A flag to indicate synchronous or asynchronous operations */
 gb_dev_loopback_rw_attr(async, u);
 /* Timeout of an individual asynchronous request */
-- 
2.53.0

