Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167224A078
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781417388; cv=none; b=gaUz7jukcZEB/t0BYI4mwUrfKHJNEif2+wKwO5d+QRZukWQqilQehBFEi2nhge9dfhPc3Zu/uvlW6eJVLs7sMHJ5AzMKqMQ+20lJU1H6GH/ZPHgjYzC3LFTwGQ11Ju+ijo1SWth4e93Yf17laYeDysigiyAT9TMHpHvpO1B5Zys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781417388; c=relaxed/simple;
	bh=w+BEYwapyEnGeH7XclT4QkIwWad4QiYpdSQPssAvQDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=krcIyYTxEKscFckbZn7x39Nw1Z+IpsGrXOaOjDfkUx/KOFtc8yiLsBF1kWaC9HwGfxnYkj8dVF06+phb0SPDFnT0keYbapwZPr/1r1GQ7Y2ZDEbEDZe3W2dpzG7jgsrUbJEJ1IQODUJO8VxNqKcM6fo2HN6MTVGo/Gwjy0C/en0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZmCt6DO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZmCt6DO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b3637b90so16390715e9.3
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 23:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781417385; x=1782022185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DrZxkAgBrgWZE1APhH3jZINrbNeZRGIQoGoFoO1ZxfA=;
        b=FZmCt6DOIEBsI2lgUSNez/MMnnJME4IfbqC7cvCYHvUNHJeG/8TILm61uPTFF1JL+u
         bN9+l9L102X7yaJ6wvG8KjpI0k5iPVEWnpnx1nES58dvt5SQJ5gh9Fkvj9emfYStpMr1
         f/D3eYaaEdXTYV4gLOJTPEr6uLSmwTt9JM1kjhGeXPevQZe9ws0htJRUlj3AZCHzdzAo
         wHGSjWjig0WOPs+AwfqYewdWBVTFcPeCldOrzVQ2BHZtlTDZ+bw3e4N1ZeVVGH2medBh
         M3myfr8OJkVEzR5xnvIS0miY6+fIiqtzOCnCFuKYzqNiCQmFt3Cz5Hd14wTCzpl25AA2
         iC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781417385; x=1782022185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrZxkAgBrgWZE1APhH3jZINrbNeZRGIQoGoFoO1ZxfA=;
        b=V/O3O1FeZAsRW0RtqXVWoCyFDKsVNqpHJYL3k4HtYxvWuCzEtY5GTl1CI9znjBZPsc
         unjXEVjSScsgvmPzfUxRN87ExFH3o2ttTXTuR5MOGYxnd0ilDc1afIVb/SHNIMT+zu+p
         oVF9BL4Ewy3FnMHrsMHokYWBFsTMU/jNbemYfkTE8HsKmzZgiE8q2QP53s5nLYcwbRLc
         GUSgxGwMngY/oUixjwsRlKXT/wApAfGBjdi60+807NHM9RCmVo9kOoQes9s+/SnD1W1W
         CcnHowUsFoC+1UAJaN035ZwWC52/jcjFghwHbqiB+iEoWrET4yGK5rPereQ5Ea2eAV4x
         dtuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8okSshELYDKEtPaXkrkIA9TP6LgMPXjimDokuzdBxbj6NDqp0Qji5/Go5TBs/OkaGIvBLnueqjTmVlSEgV@lists.linux.dev
X-Gm-Message-State: AOJu0YxXSLCOTrxo2w7XumynMeTf/F8BhV7A2GCnms0Op1olZLVfRfOG
	TnK1fF48JPjvTSSm4wrhALXo2HeQW8FsQHmUbZsPbPC2/9wcF3L5bejO
X-Gm-Gg: Acq92OGEbBKD1C5/8MatlP3CYSRQ8YVwXhV0p+X48RuGESGAWJ1KzpcjK1Dhxaee/cr
	7sjpmhk6YeeT3UJ3Lr11eTz5KAeKgkWkPO6akZSi+AT6/zXLc4O7Wf/aSM+ENA0DFMhW5RRJSY7
	mI64z8LM4Nq022ejChNpAnJ6oCwsrlx5YolKq6rgVtnjouSfRJizSs7y676Ts2oGacpJ/MWGKxo
	BVSFTxeKyL49jV1Tacstu18HaeedUv8wo1CxJqC8G2tS0LK/q8QNc5cpQ89CKDX/mZjZx6IwnBB
	x5lJV24j43tg5Rc/4MSBobduK2W0m29EVTfr6oyrcjlS4DH2dMtjbxAnoNsYsKurybymvQ0JSFm
	vHOMFoQs41pbMUmk/kHpyVn+Q+5UBV1SRuefl/exec0M64LYgOd8henvDoaJK8PCnEBn9oxWl7S
	lE5g6v6EShciGJcBFHtN0BsK8w4pMtrpXpvChN8UHWoAFOFw==
X-Received: by 2002:a7b:c8ca:0:b0:490:6237:521d with SMTP id 5b1f17b1804b1-49220092e7dmr49935755e9.13.1781417385421;
        Sat, 13 Jun 2026 23:09:45 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm125598265e9.2.2026.06.13.23.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 23:09:44 -0700 (PDT)
From: abdelnasser hussein <abdelnasserhussein11@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	abdelnasser hussein <abdelnasserhussein11@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: greybus: audio: check sscanf() result directly
Date: Sun, 14 Jun 2026 09:08:57 +0300
Message-ID: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch warns:

  drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
  warn: sscanf doesn't return error codes

sscanf() returns the number of successfully matched input items, not a
negative error code. Compare the return value directly with the expected
number of conversions instead of storing it in ret as an error code.

Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
widget id is validated earlier in the function, so the remaining branch
can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
about a potentially uninitialized variable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/

Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 720aa752e17e..6daa4e706792 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
-	if (ret < 3) {
+	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
@@ -323,7 +322,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 			ret = gbaudio_module_enable_tx(codec, module, dai_id);
 		else
 			ret = gbaudio_module_disable_tx(module, dai_id);
-	} else if (w->id == snd_soc_dapm_aif_out) {
+	} else {
 		if (enable)
 			ret = gbaudio_module_enable_rx(codec, module, dai_id);
 		else
-- 
2.54.0

