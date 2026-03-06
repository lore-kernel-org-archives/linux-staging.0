Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096ED384231
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 14:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805628; cv=none; b=BMH97/NB8ndFG3RbSetqzB2ERQbmWmwkCFaRbXJV/hM8q3cd8r5DSxQ9EdixUFC8xTMWxl97rvRc+rj2c6XhAiDLzgKeE40WwEJnraF8LSf63fmv67KjWDPFuVBWIKtuVPkkBpZxo1Yi4P8RJizR/a+2hHgb30oYUzINSHt1444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805628; c=relaxed/simple;
	bh=lsDoMa/yXIw/N3voDTw3EBx0FIC9K99qzVip2lisby0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPkPnfhTyn0Wzw4gFHvvR04rzWDE3ZCLjfYW4/mL3mIhabZMNIx05OYmL+FzNvBFfE458HDcWQE7f3Iy9rbnoL9M03t1wkeiOhU3ql2wLH/6MYxW6smswsXpDlkJ8p79uPoo8MBacsIVyUQBCvDXzxpDR51ZAtdVnzhdWDTV5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2l7MGoW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2l7MGoW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483abed83b6so77863755e9.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 06:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805620; x=1773410420; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsDoMa/yXIw/N3voDTw3EBx0FIC9K99qzVip2lisby0=;
        b=I2l7MGoWP7DtLSmMHeSZ/YJy8helzWZ6ev+jImG9026vdy6tQoKgT/Fv0ugixNlvOn
         28Z90+PGBb6XpItq/lx0p9hDMCurgik0e4vEg3l/xod2lUutayXrf6wo20FRV14QO7km
         cqFcfEI4XIRRDVtx7F85Pz0e+y0pmNsjECpYq4WqBfuwSIVeJ1hurodtxhnOWx4niC0R
         gByYJ+7aMOnvw/boaC7Nw2dPp881QlEIbqStmmlzxbZtWywg/l8sepyP10nv4/zcj4My
         4vZ+/xR6734FwZKc5tFDJydarzYJeD6qAvn05/rr5MUDCXUirk8yY8Y9Ay/ipWKKeSFG
         K7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805620; x=1773410420;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsDoMa/yXIw/N3voDTw3EBx0FIC9K99qzVip2lisby0=;
        b=N7VJ2mVm0qwKrgJTN5e7qqdcz2R27B4YoJ0l24Sub7x1lc9xWFJ7H/5Yc+67arCixY
         SGkPr+l8DEAc1UNLQJUA5YVULn2W1EYHhtDgvBhXepwdbp7no+5E29A7c/eBUmiOa1/Q
         RCDCTrPHKRSFXA4p/ym8o7BWligkmx7mUr8CjxDxtmjWKS+Wq75YcQN3hmKuJAf8y5Cs
         KoqTIIcdFYqzLJ8DR8+NIEMAaNiWeDueD5wu3LXqyfjgWSBK5EYztneH0PcikXs8Z0HW
         n7Kn4RGnkaSfz6w8uSk9QZ42WncB2UU2SNcUxlm5Sz1JhsjZNzL4WV6X98FF+1/e9zPW
         CPjw==
X-Gm-Message-State: AOJu0YzFFq8VlGmjhSVMrfdej9zNSBT6E6BQ0myfUANLjpDojDYXdhO+
	VSPNOyWTx3uRcuNsFYjbgbMaqDO6naij+aM/mYRDMXnXgjT5D09F/tOizQx5Z129
X-Gm-Gg: ATEYQzwzO3e+RRUbxzeXDh1AIwqQkaM4t3kJDQrcB4PmV/WYVVsa400GLVFkrNR/w3U
	x53oZHP8lg58jEhEWvEFi2KwO/ADzpSoDNxOCh/cxscwNEGeooLDJkSmXv3uulY5KgNPo9mnwVu
	z78VOn+K9SJp7wjHhc53igyoOi70SSjtjvQ7eqJZcT79tEEHEmY/fFMPk6FdsvSSjEayEo4ylR6
	aKt6a7stFeGj6ODR3aQtm167Kunp/sDh555Q2PuauDklUN9Lqd/mivgKle99bjOWd2E9jzhdEn4
	lZOGtOxl97VPA+TQgectUHp7KVzRSJVYAamO5mmffqUlYF1m7gjSvk7JOJa0yKP3MFRldSWZlcV
	ydIulgDFgy7C0mT6C99aTEeeyY+KF1Ma5ov2gK/6J+16HBdbAQtjpOgz/73hb6S2NntwgNYIoQF
	zIh/PzYhaXMxaKuSe+iAm0iWg=
X-Received: by 2002:a05:600c:6299:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-4852696973bmr33518775e9.21.1772805620006;
        Fri, 06 Mar 2026 06:00:20 -0800 (PST)
Received: from localhost ([188.89.210.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm4397227f8f.1.2026.03.06.06.00.19
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:19 -0800 (PST)
Date: Fri, 6 Mar 2026 15:00:19 +0100
From: Lucio Guerchi <circacircuit@gmail.com>
To: linux-staging@lists.linux.dev
Subject: no-subject
Message-ID: <aard889eD3iVXr_7@luhu-G751JY>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

subscribe linux-staging
