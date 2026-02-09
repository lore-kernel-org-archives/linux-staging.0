Received: from s.wfbtzhsw.outbound-mail.sendgrid.net (s.wfbtzhsw.outbound-mail.sendgrid.net [159.183.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BF37AA91
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647370; cv=none; b=XjQ+GwPvazlCq9rGClGdxA2IaUj7zh0K8DX/F12fgjo8bmKXHYb62XgIN/0vsQLVFALVE5sPkOsqrISxTV+uKEYsmIM850hhHBAMO396okyCzPGoGVwuBbt5EgT5dQNnuSvNJeNIerceII6W2XgKU7vdmv8cFmx4VoTfuNk0u+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647370; c=relaxed/simple;
	bh=vHetGdDhMdn61lL9xDYXqT/P+V2uhXehpyRdrdEVwgU=;
	h=From:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 To:Cc:Content-Type; b=Zq1RRfYCnQWSDej1mjpcU2g07WxNHEaCDRAqqTO3M0Wp5Q5N9N29K7/O9VTP6e0SoPnpSpsQVzTBoY9IsbwpdjYNAOCzJt9t7VOJR6N9HE5tq/LOuhHSvlAUUQllmo1aLYONafGQfsZOQVLp2M2egEDm4JaC6ZILP7+iuZ5eYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=eCjy1SBn; arc=none smtp.client-ip=159.183.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="eCjy1SBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=dMbXhd9/S9Y/DJ+qpt1Ch+LXLMFvlDpOUhtU++kh2bY=;
	b=eCjy1SBnmoYhswvwCm2V+aXivyPBwfAAHJvpoxv/l6mi1k5CN71+NTQhL2yHxHGYfRuf
	dCnpE7cJLLP0q2kdrGIj6FWhw4pcFvBRRE1BayaNvs0UtMHA8FATsnCLydqZLRtU0HVm4o
	QKTViyF9RUB6z1vxMaV8gx/7IcHCYOgSMn9ufqWPADP2Q/KdzuZ+rFw+PPpwt74dBHvGm2
	vBMfwydZfEI5+6eibCWqJfOBQ+yOmJUPOrQDcQ/iTEf3LaBpCS43xV6wtgh6aJTebSNfjz
	RfltVuVRIxp9ILfmO34qZqLNsdvyemuNtVzA+qDGfcyVpIyAOe0t0KuZZ01Cqf3Q==
Received: by recvd-784c64d46-4vfvf with SMTP id recvd-784c64d46-4vfvf-1-6989EF48-5
	2026-02-09 14:29:28.059340866 +0000 UTC m=+111053.134655920
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-11 (SG) with ESMTP
	id obLb5FnvSDan0fXQc-IBSA
	Mon, 09 Feb 2026 14:29:18.298 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id 6FA2C41178;
	Mon,  9 Feb 2026 14:29:17 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH 3/3] staging: media: atomisp: Fix missing braces for statement
 blocks
Date: Mon, 09 Feb 2026 14:29:28 +0000 (UTC)
Message-ID: <20260209142820.650334-4-matt@mattwardle.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209142820.650334-1-matt@mattwardle.net>
References: <20260209142820.650334-1-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brX0zefUrqzzC?=
 =?us-ascii?Q?BetvAov5ve1wLLT+1lpOo9AF4DoSRKKS8CtQtXe?=
 =?us-ascii?Q?ShZjar7z46K9tlWXxzbenq=2FKnog4seLMz3=2FV77Q?=
 =?us-ascii?Q?NnZrNZB57=2F91HW8BgP3IuifwwM+rv8=2FU+sNYugH?=
 =?us-ascii?Q?UUZe5kAffnrIQdrzN0C7i6tywLvs2=2Fov2896Wgw?= =?us-ascii?Q?HlBI?=
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matt Wardle
	<matt@mattwardle.net>
X-Entity-ID: u001.OAl4HwJfzvoR6h5DRlrySA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

Fix checkpatch.pl checks:

CHECK: Unbalanced braces around else statement
CHECK: braces {} should be used on all arms of this statement
CHECK: Blank lines aren't necessary before a close brace '}'

Signed-off-by: Matt Wardle <matt@mattwardle.net>
---
 .../staging/media/atomisp/pci/base/refcount/src/refcount.c | 7 ++++---
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c    | 6 ++++--
 drivers/staging/media/atomisp/pci/sh_css.c                 | 1 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c              | 3 ++-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 4a8675d0129a..65dda74614f6 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -140,13 +140,14 @@ ia_css_ptr ia_css_refcount_increment(s32 id, ia_css_ptr ptr)
 		return mmgr_NULL;
 	}
 
-	if (entry->data == ptr)
+	if (entry->data == ptr) {
 		entry->count += 1;
-	else if (entry->data == mmgr_NULL) {
+	} else if (entry->data == mmgr_NULL) {
 		entry->data = ptr;
 		entry->count = 1;
-	} else
+	} else {
 		return mmgr_NULL;
+	}
 
 	return ptr;
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..66e72f2ce288 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -484,13 +484,15 @@ int ia_css_isys_convert_compressed_format(
 			default:
 				err = -EINVAL;
 			}
-		} else
+		} else {
 			err = -EINVAL;
+		}
 		cfg->csi_port_attr.comp_predictor =
 		    sh_css_csi2_compression_type_2_mipi_predictor(comp->type);
 		cfg->csi_port_attr.comp_enable = true;
-	} else /* No compression */
+	} else { /* No compression */
 		cfg->csi_port_attr.comp_enable = false;
+	}
 	return err;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index e7f2443696d1..27b552501e7f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3520,7 +3520,6 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 				    "ia_css_pipe_enqueue_buffer() buf_type=%d, data(DDR address)=0x%x\n",
 				    buf_type, buffer->data.frame->data);
-
 	}
 
 	/* start of test for using rmgr for acq/rel memory */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..0fb6a90fcbcb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1484,10 +1484,11 @@ sh_css_update_host2sp_cont_num_raw_frames(unsigned int num_frames,
 						      host2sp_cont_extra_num_raw_frames)
 			       / sizeof(int);
 		store_sp_array_uint(host_sp_com, offset_extra, extra_num_frames);
-	} else
+	} else {
 		offset = (unsigned int)offsetof(struct host_sp_communication,
 						host2sp_cont_target_num_raw_frames)
 			 / sizeof(int);
+	}
 
 	store_sp_array_uint(host_sp_com, offset, num_frames);
 }
-- 
2.53.0

