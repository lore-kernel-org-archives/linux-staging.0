Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634331E520A
	for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195986; cv=none; b=ZatxWrBrTvz5Kuegt3/AozHRZ4fWIG2EV6WdMITqmO2Z+0esep9LIs+JAwEDdeQsNXsSh4Rkx+823cWjVkuVag1eiSb/GcYpb17GgKbC79BMuXHZPMUh1xa6gyRK9qzNwlll8z4PgFohklILVZVubI0Yfvo1gb15coD6XRijdoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195986; c=relaxed/simple;
	bh=F2n2aPv/h0ubfFF8A72KzHr2JKl3CHj9D6kh9e0E8Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqqxyZqk7qO7kyCN4yoE2gyK6GkIeXaUSP0DHzaXa05xvi6FS69pardsxqkOw9bcKj49k+0X0K9C8IX8l0s9/UaPpggEhfViRnIaZVysKT0fgKcGjE0BdZJA8fxPM7OKQHyU6ig3GRySglRk5/4SB5ka4Ws0cWzSCqoKUn8LbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6zCS/4c; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6zCS/4c"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35ef6b49813so807250eec.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 17:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195983; x=1792800783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2n2aPv/h0ubfFF8A72KzHr2JKl3CHj9D6kh9e0E8Jw=;
        b=K6zCS/4cqbns+LG+XuAI1s+TUAsBgREHmI8IVa0iUt8Ff2lJuvW1sbtXs4IRHycugB
         cP/xNtTV7rsoTg6rqlIBq/ZrMUBHruT6AWbZtd/pyoc9tNbXKGRKAQu9RBDlSaqW0qBt
         Cp6LBGOLtV3nEDgD+lyeq1V4/ykQtyXg3r2BBOjtsN+nySn0v3cCfZtNAkx/XcpTwN7l
         ou1zb0NDRWDLbLIYGBG6D7akzjyt+LMUojdL2TUYQWfK9lIJapHNpDVveXDaDrgLJ4dR
         HlhQvXP9VcyUheST3tvOgj7JtcqhUflQx2M0TGl9wW+UjO/LZJ1CUvu5YphW5OAeKect
         Vs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195983; x=1792800783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2n2aPv/h0ubfFF8A72KzHr2JKl3CHj9D6kh9e0E8Jw=;
        b=L2ybhOpJCDo9WQ7pEVJ75aLqcAVK9KDQb24vdqjRAxelHw0Wj9ptl9YA3OrQXvKAxz
         xXQR251W8cDTt8vsuDmIvIgci6R1m69W+BeE7C64QVHBxMVaEeQ0nQ37hI+cSOC8ZoM2
         a8HUoA7+qLiioCUJ5Yms/0xX/czupuHEubUwtI+7t3BcE1CIlAQr72sQ6mDInvVkCfQa
         t4xWuJ4ElWHHFExaeaendP7RdnqcDYJIOhRFeTeDZTB3HrDMxn1UYgjMJudiTAvLDEFB
         j4HhvkzILA1xbeljR2y6j6pLkgifvCT3jCpDIdEvZxdYxLu91kzKvuq0MWRoxZTGHB3q
         +a3w==
X-Forwarded-Encrypted: i=1; AKwUvByIl6bAwZ+ah2GjrTdNzUaQHOz5ssosYb8eZcssdeMrqlFMOXeplqMnQBLyt32TrlZMB8ulVC4Kg6LfOQxq@lists.linux.dev
X-Gm-Message-State: AFq9FYJI3TsM5YuR7FVLcDGy8g3RJ5eOnywwlPbU8yUEeHgGwHnhLTBC
	1IF4nor6uwEORK7weww0dzN+Hay4Hx6esRm70elarfxQwAArSAgdgk9Z
X-Gm-Gg: AYBFou2WJcI5R/1PJ4XyWiB7/H6ygDFmImZhWLF1dofOwTJPdbNebJr+Uo9r5drTcKX
	AIM69jAUoI2wRg2/yFzWFYisX8wFFpfS44Otg31/u30de6+3Ea+XD/DxLzv2VjjtjeJvGpyV7G0
	JKtmEwsK0iffv2wPQeGvdnuDpInOtoXoauHoaRk6qLjDhW76oM7j9ixkv5s28HtQESJq/euOB8l
	bg/2NhN4sl6laDTGfZt94NYWCZVrAo1Irg6hoAl/FNSFZxlnzkLb2dd8WS+N7wVgqkp5Zz81fcw
	Hx5D5tNkvdxhe5PYpLivTQqHxE2ycbLLhp9GHJdhCeS87wIe5Aibik8mLTkM6Z948tHY3MjnbHY
	WMwvs6lwaPSDgyHuvYvabti1QCQT2Hg+XoIkd86jU1HImqL9kmhwitWBXZDpFC1qapotpNTiy7w
	UOM31YkeQ7onnIpX5kQ47Vz0nnwwyOK85cDgsddUBl4Oecl0RQ3OjVK24f1rcgIsDCQGRF7Wx9Y
	Yf7pioN8KuK7gz3Ru8o9FNnqWcQntDoTqMnmLMwOTB6kE06OVE=
X-Received: by 2002:a05:7301:2727:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3619f1fd67emr1975611eec.3.1792195983154;
        Fri, 16 Oct 2026 17:13:03 -0700 (PDT)
Received: from samaritan.sole-larch.ts.net ([38.78.160.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm9384784eec.22.2026.10.16.17.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:13:02 -0700 (PDT)
From: iuseacosbtw@gmail.com
To: ethantidmore06@gmail.com
Cc: gregkh@linuxfoundation.org,
	iuseacosbtw@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] rtl8723bs: Remove redundant macro in basic_types.h
Date: Fri, 16 Oct 2026 17:12:56 -0700
Message-ID: <20261017001302.102960-1-iuseacosbtw@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DM6MIWQ5MROM.26MIBOH4D61MD@gmail.com>
References: <DM6MIWQ5MROM.26MIBOH4D61MD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> No more patches for this driver are being accepted. This driver is being
> deleted in the next merge window.

Thank you, this saves me a lot of time!
