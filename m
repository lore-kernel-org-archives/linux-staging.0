Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955CA423A79
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440200; cv=none; b=j2LVI6Ffs2B++o+6QMd8TnJfNJjis4yk6Q6SHndQzY1rjszgzg5fSg5XTHUauhVCX4AA1lY2GScgbp2bxu9u0lWyF3z6DGpLXfEw9YMGuxs4V2kn98J/+Siobe5TxampUjEN4hmdeXOrteeOKFc2ISte8TdgY5CYR26zaXxg/1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440200; c=relaxed/simple;
	bh=1tmQDfQGbuv3RQXZviVom1NGg8FgWSQa45ieyeqjpiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQzdkW8kA9oG0zjg+hj56p6UgjIjIstnTHGLdHUjFQD82Du0OMmwaF6tv3SAVn50O09r69ODnvjwNapSMMuq4ckTe7cvJX9DZWSoi71X/mcPIjk/A+zsyqSyFJtobaVWqyIU9Xw2YDbp2daf58CWlkiVLC68HlMV7S78UKV5PKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 454fe370956611f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8d8769e7-47aa-4ece-b4c1-e9c890dfdcf5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:2f8c95e5b12852334618ba02968d8797,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 454fe370956611f1aa26b74ffac11d73-20260811
X-User: jiangyunshui@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 867526082; Tue, 11 Aug 2026 17:23:10 +0800
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	martyn@welchs.me.uk,
	jiangyunshui@kylinos.cn
Subject: [PATCH v2] staging: vme_user: fake: stop tasklet before freeing its data
Date: Tue, 11 Aug 2026 17:18:30 +0800
Message-ID: <20260811092300.368329-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2026081116-flounder-facing-6ef7@gregkh>
References: <2026081116-flounder-facing-6ef7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unfortunately, I don't have a setup to trigger this specific VME
interrupt scenario dynamically. While, I think that to avoid UAF risk,
a tasklet must be explicitly killed before its associated data structure
is freed.

Changes in v2:
- Added the Assisted-by tag
- Fixed the Signed-off-by tag

In-Reply-To: 2026081116-flounder-facing-6ef7@gregkh

