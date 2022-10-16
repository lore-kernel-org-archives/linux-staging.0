Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B117A56
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1665945132; bh=4G56bSlLOLrcaLn4Uq48hpApQ6wrSOLBN5mQr4hpOAo=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=ehU+rMtb+XMbyMl6yKBF770Edk3NJna9Po5VWYmyYmnuVdodz0p9FKXhjjJVODxs1
	 xZE+0bea7423RhVPKxqqynjmw4UvIQWp+9o3Kg026XfedjNE9pgQEGM2Mu/+ilw+Wu
	 Vg53QwvPP6AtCPboxKeZQVtnArhe9ueXywqdsdq0=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Sun, 16 Oct 2022 20:32:12 +0200 (CEST)
X-EA-Auth: RbEaKFyxBuDMr3JtziJUqqWdNO/EGUTB6u/gb48BydESCQyZelGYzoJ60zmUJP9gWHrCpuiusI8q0PP69kCUZ6h7j1oeXv5M
Date: Sun, 16 Oct 2022 14:32:08 -0400
From: Deepak R Varma <drv@mailo.com>
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: query on fixing checkpatch BUG() variants warning
Message-ID: <Y0xOKFkL84jqTSj8@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
I am participating in Outreachy program for Dec 2022. Could you please suggest
if I should explore resolving following checkpatch warning reported by
driver/stagning/most/*/*.c files?

Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants


Thank you,
./drv


