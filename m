Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8473E5EE8
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975475; cv=none; b=TQlEE1n9zIaDvJB3AJBvzXJoW0lrMmAQEiIYhj6oqzCRP6liRKVLbv1ToYRiEPdmQoV/iDW4UmLpxOn3IKl+KboWeG5Q2d9ugavGcoTy75j2bU7+7k2rsovT+NHX4oKnNs8ue/OcaF0BsQ1utF/k9nMz8vQnefcGpXT2ONRWouA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975475; c=relaxed/simple;
	bh=FQBwFO0MgxFGzUc/YQnZzztfDYDuCdD+FD2YOYudnD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GO5wZz9XNX8ga29Z70iuSiSyIj1HWKof1PcxKR/rQzmDecw6V1V+ZnkzZoiAAOHWNOlVUfNyyaOQyWYNt0oou7CXajRvbiuRjAFruyVizOVjb4rf+SpYEN+Rg6BgHPD/R0Ckcj+PC4wMt7H9YeyrmEdMeDMjYA20CG5EtSYHGTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYwZf6+Z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYwZf6+Z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso11820385e9.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774975472; x=1775580272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JraACsWoveWjT2/Q+aQPIDXu+oIysQlLH7Z9AJtH7Ow=;
        b=OYwZf6+ZfnE3XcINslAnlA6chANPmqcC1mIBMPW+8SvT+2QSXQHuryRozSy1/35EbZ
         V0rw6ZYjwowU+atrxJk8lFEHuhbkhicCVtNMWdlG1ijBUVy9GERtxxlVusm18eUMDnmL
         1FuA5PJTfRI8oEJWrKkbtmmaEm8VlW3Ip8ZiZh6ygndcyU6Zp6ZPkwrjI2v/vYb43un2
         c6WBOPtcJ3qYJhY4UI7AnKi+WHwMV9xXBFsSqXUDmRPxmr6UbCFfIQIFbOt4Si537oZ+
         haptiOC/vPiCgUavgITQajLosio6PU73IqzSQD5NzpKAtItQyzbxF/t8jHH58WUukujH
         n1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975472; x=1775580272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JraACsWoveWjT2/Q+aQPIDXu+oIysQlLH7Z9AJtH7Ow=;
        b=gojgRZwQKwTVbf0Elm/SP/fjxQ60w1dBMYEyxMuFCT82ubSe70mOElF9i9Qhp3CxTj
         vwZ+hGVrzvMj5W56JQprXwdP8YcfR2U7TeJXwAwumk3+31gI4Vryo+hfJ1keZocq5vLh
         0BUhgo7X8rKApwYUfmEsOTJDxTE3erBfUAIjNOdb4GgAF76cF77mWDtAshzyzmJ6E2ii
         eSdPlOaUDGLaoC23HrKg0b48BrgnXGtqpjZvjPdGPqFh6FCRSipMWwN5cYQ0SrENwCJy
         0U0vMTvr0NSrcGIBKopyeHNIhpUuqqL249o7/UCMJBtnKoFg9qido+T2g0ipBB1tzqDJ
         mnJw==
X-Forwarded-Encrypted: i=1; AJvYcCVsnmIFnNNIrt6fqx3FFcXz89QEeHViGGeKOKteiZJctcqqWq8bKfrr5sLtahI+xk2JGL0BOJ+CQMbZMBG4@lists.linux.dev
X-Gm-Message-State: AOJu0YxU4Ym8w08UfW9EpcdsF2b6H395w/i1Ca0zbLC3rzFZWC+FRHwq
	jnpPT1ItNOl2f6b8R0uXxpbm68DeXmtNtZ9LE83Oc9qKnKd9NZkGrqfk
X-Gm-Gg: ATEYQzxIMQtCclpox6UaPiYN6imiMP0WYMhcdHzAK9gWm+wvDAMFi+xfyy73wfVkzZW
	JjkPdufygIM5G0rqZC2dOodDzlNvKq6rfGBCKtT4WEsygi6aDSnzxbeNfe8MBP5UM2zAaxIQniI
	wCveqaUgyBgua/K5+A1GdQ3gePIwWzmhvN/YOY0SKyd7iaaOiwb3IUL6l0n0p8Ire7zcnLQOJhm
	1jXzGrOyHxMWnmwtjyulNBuNxT9dKapFweQ/OLheTUmocKYZ32EPnU7Re8cO+QXnxSrAOe2RaFn
	odSYajTHbWOeQI8Lcz+G/B6FPioea2FSgxTcoQsuNnjFzxNtf2WeIcnxpSSSNFI3QpnmyJHSDjX
	GycZPeeBNZjYucPN394YfXtT3C0xe585GYDzJFgHax4T3kZxfgXemopgcIBEgxWtzBgZ0V2G+sF
	V9SnjPGTa7hSnLomB2girfpTS04+Udsm7eXQYx+/3N2Qva6GF0WNWd
X-Received: by 2002:a05:600c:3b1f:b0:488:7c98:e9df with SMTP id 5b1f17b1804b1-48883306d7emr2300745e9.0.1774975471864;
        Tue, 31 Mar 2026 09:44:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:7962:f026:60f9:dfb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm51173135e9.8.2026.03.31.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:44:31 -0700 (PDT)
From: grondon@gmail.com
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: Re: [PATCH v2 2/5] staging: most: dim2: replace BUG_ON() in service_done_flag()
Date: Tue, 31 Mar 2026 17:44:29 +0100
Message-Id: <20260331164429.47314-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <acuoL4DRi0pmsQY1@stanley.mountain>
References: <acuoL4DRi0pmsQY1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

On Tue, 31 Mar 2026 13:55:43 +0300, Dan Carpenter wrote:
> hdm_ch can't be NULL.  It's a pointer to the middle of a struct plus
> an offset.

You're right, the NULL check is unnecessary here. Will send a fix
removing the !hdm_ch check and keeping only !hdm_ch->is_initialized.

Thanks,
Gabriel
