Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD41C29C;
	Sat, 16 Mar 2024 20:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710621752; cv=none; b=RKd6LJocfp8dR1BGPXZmzxYwvzKneV4fxKyZm07L65RsYCqmLRnCcKjbcSIJ8uGb7yjGZ1QBi5adoOANUZD5SpgV3eQWxLuc9CrB5q7shOKF9VOFb0xncaW2iQB9rhCO3r02PmfjY8rw6Lko2wQBjRzW5sm39Lzm2XTexmN1Btk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710621752; c=relaxed/simple;
	bh=7d9LxjljR/GIHgGBPZniwnhKo0p3y0egbVztTz9ELzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EXfVBxJR7VvGTKYnzAAoLudObHDqG62Z5jQgCueJbGI5WwK3ylST2xE2JJwz3h3VEhSjM6JQceRnRtJhFOC419t5VCVQLGO8FxhEpxQOG2XnP1GzIp3pDmg5yZshEMwa7FSArb3uTjEvB6n5mJ49FBbwyzkNqBe4JvBjk5pHnPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXn86ent; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXn86ent"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a469ee62fd1so128038966b.0;
        Sat, 16 Mar 2024 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710621749; x=1711226549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MejTbP+k+R8k80paKCW+CmGuisFHW3BOu8XCILnbXi0=;
        b=YXn86entKKVXoIdjJCfQmlIxWxVAhpJ2PaLyzhOkw3RuJI3bGutCjyKX1Bv2qZ0oFh
         SzzFDD54k4dtWUMHtl0yFK/8Kz4tuj4SMskcduP+geMGcZ4fH2Fbzva3WLOlZSVVnkh4
         jTs/AlRW/3sD82pbBB61p0nHngYKjXiFrXlslwjoOygDVcrhBaZ3AVbvj+ePlqLyJ/ZH
         oLng+/JY2+1urAh//zY0Jx+FCQh6ovMtBux2vW7BHtYAUese2nlatuWRTHuKA61f8zWi
         aXVr6qZTEl7ObBVshHidNlCzfSn7hTE1iE7LycubraFJlAGBYiLTJHvjFvkdPXlQ1cP6
         27ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710621749; x=1711226549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MejTbP+k+R8k80paKCW+CmGuisFHW3BOu8XCILnbXi0=;
        b=lvDbJJXYsuT4g5Q9nsduDS5hZa5YmUezXD2pzfc/3iBySk34iHTY5HTLnYFQa3hlSQ
         fBj71qM45V3gnJh8tc8HN/QvD/vQ8SLmxs0qcJKerAIoVThd+gTnCWcqHaiYHN7Q1Y4I
         wBnhMKtEb5I+ZUa09Kw6Yw0+p5mXcQ2/bf9MqBOas16h8d0sO/HxbHBctlJA3B2MRv68
         vs2Hk1Sq6MEYWs2bN1Rkwdl4EkyYUWDD9m9NHzPl6T02722cpadrW/f4mo7tRXWVWYX4
         xvS+NXeV9+ARD1Z70XThIzbAOvdU3DqRegH780MOsIG7lz0t4RF+jn+mZDZkyClN3AZF
         BboQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqnUtpSxjSqswxc4Y0z3HpV3oeZB+Nb0mQClZ0zJV5/rgJ10/FEZKvFSz9YC/fBnRp+GolrX3nuMDUWsDI3LkNeEId2zwz1aaYvt3e47zKIS1HSyRM25fH7i0ZePMzhYPcNdrAVQAF2g==
X-Gm-Message-State: AOJu0YxPRLgPwkHtZi2z9Wv9BsgW/LS4919osv07R+FdWRCV0wTeKiPh
	HAJAgo2X+d21oDr2IPd9TApcRuZ3NEy2uU++cU58sQkA2jbyCUE9
X-Google-Smtp-Source: AGHT+IET2mrQJ049FYAXmuObAU+mqfsvDaCIRnm+CxoU/YK8sR4eevlwzqsbPZt640Nsquckz0LKww==
X-Received: by 2002:a17:906:6a22:b0:a46:8c0a:4dbe with SMTP id qw34-20020a1709066a2200b00a468c0a4dbemr4059333ejc.9.1710621748614;
        Sat, 16 Mar 2024 13:42:28 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id h9-20020a170906110900b00a4665cd5664sm3048848eja.119.2024.03.16.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 13:42:28 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@forestbond.com,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org
Subject: [PATCH v8] staging: vt6655: Remove unused  declaration of RFbAL7230SelectChannelPostProcess()
Date: Sat, 16 Mar 2024 20:42:07 +0000
Message-Id: <20240316204207.1779-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function RFbAL7230SelectChannelPostProcess declared in
rf.h but has no associated implementation.

Commit dd2837bdea0e removed the RFbAL7230SelectChannelPostProcess() but
accidentally forgot to delete the declaration in the header file.

Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c")
Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:

V2: - Removed the unintended blank line after removing the dead code
    - Removed "in rf.h" from the subject

V3: - Added in the Description Comment about unintended blank line

V4: - Adjusted complete description according to hint from feedback
    - Rebased patch
V5: - Added a missing closing parenthesis in the fixes tag

V6: - Sent the wrong patch for v5. This version includes the fix in v5

V7: - Made the subjectline more uniques as suggested by
      fabio.maria.de.francesco@linux.intel.com

V8: - Put the entire subject on one line to ensure the function name
      appears on the subject

 drivers/staging/vt6655/rf.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 6f842ac00526..8eef100c7ef2 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -68,8 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

-/* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
-/* }} RobertYu */
-
 #endif /* __RF_H__ */
--
2.25.1

