Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9341DE4E3
	for <linux-staging@lists.linux.dev>; Thu, 16 Jan 2025 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025223; cv=none; b=XiQR1Ka3xrTWx7cfV/GijMhrqH8ctm+5StcNCGBndDSn8UVgdRDEXvxAVPLZQ2uA3CZA7dMAXbM1UyNOmBTB2G1OQsKeBULzAiQpWXSCZL0UEdk1E0O3agfghqalZ7+RDDWOQaV+qwhA8rzA5DDC2mBUifhQF8NTtxvRDAif7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025223; c=relaxed/simple;
	bh=ipM0MPZeXPihT5seNO+NiqYgP2E6p8/nfHYby3sp6dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JQuSZD+25QlmehmGpLK5V0Yp6uH81cZ2e4rfvDokIznBzlGTDzlfZsKSiA0T305DwDrlwpmTqvmKeoEft9F1Qrypw4eoYiKEkjXPAs52Xs942V5ypeobGyPdhf+6zzB++2dB4Qyl7A6LO1l1i+t/Ipy46IK1wu/xhq1Bf2ipHlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3CaVvsB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3CaVvsB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43675b1155bso7624035e9.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Jan 2025 03:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737025219; x=1737630019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xepS2fu3cKrz8LIIOVhyaQuv0/xz6GPrtahTWM5I9dw=;
        b=c3CaVvsBhWXsPfv1EoNm3W7nnCp2iJD9yr1tw5biV4H+gLFko753PQWkCafT9D2mTW
         UtQHQn38o8EhRDvBeDF5QVMSnieB/zp0505y9BIqDLlNSXxcM9P5fXYKxaiW/6PDEJ8u
         wXEorAMzI18Fes5HDj/NqlqnItMlOCtMIMRReTSenSMP7YZFu34RCFArZQkjGI5VdIlf
         OD6A4t3rdYE3GtykDAD4n2sBDfI6ZdZ5YIQsHXs8+aCX3nmeZT9avif2i1pna25uv+9O
         LFCX0hTBWHyHUiwpZ9I9E6KGTDFBDNKbF73pGnQK+LGo2Mr6SrFiE7QlHPpr6d86TQaB
         kKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737025219; x=1737630019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xepS2fu3cKrz8LIIOVhyaQuv0/xz6GPrtahTWM5I9dw=;
        b=OuQx+R7biKbZFN8E725EolET+5FwblxbOu5wICKc/tOp9/j8fas+XWvf8wciCMtPEm
         KDWc7t/09tK4/ijkW49LQDhCckpwrnfV8ZtsJIh3SCgrd+p9KFbphowToBURKfAbCTEm
         Jqcv269z3Q9PFmtXIKwgIiDaANbW08sqb8bpmd909rSa4waqkC4PoYNlur3fF3bOzrlr
         dLXcj1yYmsxKzCvpL1u1UfPk3ST6wT2EtXFD1nIv+4oLHqIh8MecHogqC6V8gwa/Y78c
         bk28ipntuzg8BAQmcKKsVwQgNNJvJNoAXEBNpi5J13EyBfS5YZZ+AwAgqeTuN/7lCsgv
         meMw==
X-Forwarded-Encrypted: i=1; AJvYcCXyHOIfNOqpFhLGGE4faFhZnlSo8Su92NoNTk9qfuKuwmWX9dQ7F6jt0YIwp2aXVykGLp8iUooezlg+ai3Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwSnM+EiWq/qCZnTelDv0lOMWJezmLPkWVUjPh4/s1XM1t4l8Aa
	NDiOfIagNAWfp0KdrvtgsLSLtL1ANqT5SQLdK2aRlewDm4Y8241J
X-Gm-Gg: ASbGncvJW0hlnwDqfDt3CoHjmguyIUez7kKa6X3Do9U6iI5DbtKGyCYIFRmHNp3bwIb
	7LS2vWgiPtgN2TfdimivLfKsccc9NiQ2veyOPaFGuFWNbLQMBOZTmQfbXR3edvwv7pVvhoTqi5T
	JWzcD13Kyx+aMcTd/bbZSDnwRAtrkJPSyjSREIs31D+qHyUpW+FYKp+6OjN2LZdqLy/t2HvkVoU
	dysMIBQJel4vSeAE1SsDArOM8QF850Zi8Ij8MZWcPmsGwQN4aktaZpQwPWxPBO6qarqB8GoqMes
	D+qy4FDwD6Wgk4qa
X-Google-Smtp-Source: AGHT+IGF1lYlRFxNhIQtUwEY0pqSA8S+Ddg4nfCQ4b41q5oJDp4RLShtNEZzQc0uPW8BibK8F7yT7A==
X-Received: by 2002:a5d:5f85:0:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-38a8732c132mr29635959f8f.43.1737025219100;
        Thu, 16 Jan 2025 03:00:19 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf78sm19934562f8f.48.2025.01.16.03.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:00:18 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix inadvertent negative shift
Date: Thu, 16 Jan 2025 12:00:14 +0100
Message-ID: <20250116110014.15577-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the initial checkpatch cleanup, when removing blanks
after open parentheses, a minus sign in the argument of a shift
operation was deleted by mistake. This transformed a pre-decrement
operation into a negation.

The result of a negative shift is undefined and a warning was
signalled by sparse.

Restore the pre-decrement operation.

Fixes: 6c52d5e3cde2 ("staging: gpib: Add common include files for GPIB drivers")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/include/amcc5920.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/amcc5920.h b/drivers/staging/gpib/include/amcc5920.h
index 766b3799223f..7a88bd282feb 100644
--- a/drivers/staging/gpib/include/amcc5920.h
+++ b/drivers/staging/gpib/include/amcc5920.h
@@ -22,7 +22,7 @@ static const int bits_per_region = 8;
 
 static inline uint32_t amcc_wait_state_bits(unsigned int region, unsigned int num_wait_states)
 {
-	return (num_wait_states & 0x7) << (-region * bits_per_region);
+	return (num_wait_states & 0x7) << (--region * bits_per_region);
 };
 
 enum amcc_prefetch_bits {
-- 
2.47.1

