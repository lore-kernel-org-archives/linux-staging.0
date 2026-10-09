Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10A7361DDA
	for <linux-staging@lists.linux.dev>; Fri,  9 Oct 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560743; cv=none; b=B6wDu/xDNFtCIryXjDi/qW9tMe5t6QkapaJD9ru8B+2q6bXfSaolUZj+UdRnwOCMIGdkmgiaS/rOmSZuVl27jz9DJDnkmcelk7o07F4BuvT4TdsvrHoyLGcEeD2rq9nnT00fch7NHpJBw3xTiJe5fSIYCzHBAobea8rLAyG++0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560743; c=relaxed/simple;
	bh=0hmzs9h5qZTAmchh3MT2c4yANJLrZTwAQckHMWIERCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9nasMznLFymAwUPB5c7GsWnLYSid52w0v4y67bmeSyjK2Qcp7wphXauVI2/1UF2saLB0M55lCYz55vxV4Rr9eNp6sgT+2CL75HE5SVFL4FTNEgUmWYjy1tw69BY0KXL0L6JueJ9FyQodvCdR05ko7Eg3scPgh67xNAjJEEHhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=VU/Cfc5U; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="VU/Cfc5U"
Received: from localhost.localdomain (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id D587520B7168;
	Fri,  9 Oct 2026 08:45:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D587520B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791560740;
	bh=OPNpKz6OHklbJCYVRtqhmrTLvTXsKAqbS+7QlmXkvaI=;
	h=From:To:Cc:Subject:Date:From;
	b=VU/Cfc5UHkvAXTpc0qzynMKbbdWrmHeuiwj7u5CtcZeQPAZBCIaoxaWUQEj4lpnbH
	 DBtbWkCFrIzuBS/pm+uOTba8GagA64Ib83AYYRdG/GCIFYXtx505DQr5wcnWR6ZfYI
	 cyVn6H7UEGVkaeDHjdI1gwyZoFggp3CLsrza1Nro=
From: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Cen Zhang <cenzhang@linux.microsoft.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: update outdated struct fbtft_ops comment
Date: Fri,  9 Oct 2026 11:45:26 -0400
Message-ID: <20261009154526.43528-1-cenzhang@linux.microsoft.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct struct fbtft_ops outdated kernel-doc comment: 1) update
field write_reg to write_register; 2) remove non-existing field
free_gpios.

Signed-off-by: Cen Zhang (Microsoft) <cenzhang@linux.microsoft.com>
---
 drivers/staging/fbtft/fbtft.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index c7afb0fd3943..40a7567df1eb 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -37,7 +37,7 @@ struct fbtft_par;
  * @write: Writes to interface bus
  * @read: Reads from interface bus
  * @write_vmem: Writes video memory to display
- * @write_reg: Writes to controller register
+ * @write_register: Writes to controller register
  * @set_addr_win: Set the GRAM update window
  * @reset: Reset the LCD controller
  * @mkdirty: Marks display lines for update
@@ -46,7 +46,6 @@ struct fbtft_par;
  * @blank: Blank the display (optional)
  * @request_gpios_match: Do pinname to gpio matching
  * @request_gpios: Request gpios from the kernel
- * @free_gpios: Free previously requested gpios
  * @verify_gpios: Verify that necessary gpios is present (optional)
  * @register_backlight: Used to register backlight device (optional)
  * @unregister_backlight: Unregister backlight device (optional)
-- 
2.55.0

