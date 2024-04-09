Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E9153582
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712683708; cv=none; b=OCjEGCTyBA/IGl2e44lRqChmIrHmJ9pVbln/W8JgjqkGkoIM56ownkz1MXfPZL4fDyPAqMZUImHqgSTW32yo+yKFlSPQkVq4+x8Di2NdsBwXkRcVSGmm2bM8KLj7LZb4xHm0SYz7J9DVaBPDQ6MAleeXLHpeqsAEHzQDF8inN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712683708; c=relaxed/simple;
	bh=fa5Dmlr/NPrypZkGeE7E1g8PAi/Q7m7ruLjA0BtX6rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+43b1CesRWGZUrShqOMBcsUBKD6ye8XvH0C1Iz3Xu4/h/RZF8/OEtO+kEYgioB/Sk2Qzui6QjbSIvx9oC/pTd8eXSpjyinRrlI3qi5CA0I3SHEelPYXcVRWHNWQn7fjxv28GA/aarAp3Aa6P7DpZmxv/hgeAXuJDRecoatYbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jt0fnNjv; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jt0fnNjv"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a528e7f2b6so1621840a91.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Apr 2024 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712683706; x=1713288506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa5Dmlr/NPrypZkGeE7E1g8PAi/Q7m7ruLjA0BtX6rQ=;
        b=Jt0fnNjvyNk/oDmx+zcsydQeAufojJHu9jlZ1cagIUQN2+qx7Xp80kYHnRaeOzQhLj
         kw4zK3iFb0GslxlEwcEgPnl91pIl2naMpF//EpsxKfZzifyOrXKPZwvyZ8dTljTf7ZmA
         NXdM7xatFCp8fK+OomuSMnbn6sTIjg5CDZ2zCp6gqk6MPQrtB99LeL79bHFMcicQjkhn
         ItKc538Mv/63x6Ulo8LSTf6DWgls/SNhy/JPlmExQMfoKqEh5Wk3Q2+YH9ESnhuF0U3C
         UWzmce5orv0PHkNfztvI51fr8EaxVDSDyd6LDRNXnK4UfOEZsc4PC1ffJTiOY3sG+rBP
         V3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712683706; x=1713288506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa5Dmlr/NPrypZkGeE7E1g8PAi/Q7m7ruLjA0BtX6rQ=;
        b=VcNHr75q6ES2hSF6yD+fYYVvuHGooUpl2ILYXc7ImM1I1wgq+gXtkfYHU6N4KLe05d
         TEH9mwth+g4ZAiTIDk9rRi/Dy6krRQTf2GWnGKPFr65kGLj7l6p2rcB/cIV9TLWT3Gqm
         BFX36p4FMq/0jVwI2CwBC0mXnlgHGe1UNfdQZ5H7mw2izV79T/O0KCjBVtCd6aQlrlME
         61PLlXCeE3eNSLFuu9tUi/f7nQ6UrwISVfnDmNrPJZdTc7rKH00ti0OKPikmVs3w4Z3p
         uAsYX0UrVQ0GUNVwiJgxd0SRntBuaNVF4NbJJujEQ0+5awnxVd+sRPz4fpMRdCV/WV34
         /msA==
X-Forwarded-Encrypted: i=1; AJvYcCUPLKnYoQxY+T1b+rXmEx8vEqPcSLh3fxSbyH48AaWuvbL6uQsBY8gev8/phtiOSST8OBZGek/FnLMWsenNrxULj8heolsS9xr4kOnFVQ==
X-Gm-Message-State: AOJu0YwJZlQQjfCOAFIhyrm+m0hUg11c5unMJjHRp7AJc2mFeaemaBrl
	xRn9YncrSandDWRa0066Red45eP5RL0jqDuvN2TEonFr3cNZpgOU
X-Google-Smtp-Source: AGHT+IHWbihX0WFZNpRScBdUcc2XFZ+GfokTuBZqI3IxOqoMWFCNXFSpx8VlYzMg+AyQE9dKmaJDug==
X-Received: by 2002:a17:90a:ac9:b0:29c:7566:a1d6 with SMTP id r9-20020a17090a0ac900b0029c7566a1d6mr330992pje.25.1712683706037;
        Tue, 09 Apr 2024 10:28:26 -0700 (PDT)
Received: from localhost.localdomain ([172.93.220.120])
        by smtp.gmail.com with ESMTPSA id n5-20020a17090a394500b002a55198259fsm2136700pjf.0.2024.04.09.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 10:28:25 -0700 (PDT)
From: Yuguo Pei <purofle@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	purofle@gmail.com
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Date: Wed, 10 Apr 2024 01:28:06 +0800
Message-ID: <20240409172806.8527-1-purofle@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <2024040935-naturist-skimmer-391f@gregkh>
References: <2024040935-naturist-skimmer-391f@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 9 Apr 2024 17:49:25 +0200, Greg KH wrote:
> So you are now hard-coding the size?

Yes, the change just helps developers who want to adapt to different screen sizes.

> Is this always going to be 0, if so, why need it at all?

Not sure. For example, when HEIGHT and WIDTH are 240 and 280, LEFT_OFFSET is 20 and TOP_OFFSET is 0. Different screens may have different offsets.

In addition, do I need to resend the patch to modify the Signed-off-by?

thanks,
purofle
