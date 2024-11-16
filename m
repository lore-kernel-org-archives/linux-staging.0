Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908C154C00
	for <linux-staging@lists.linux.dev>; Sat, 16 Nov 2024 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771655; cv=none; b=Rhd/whSNfsn2H6j5OCAqc0PedgfdxMwt7R+mPbGzyOZzW034t5VsEnR6eJjN6zmO/VPnnqHIdfJRslsB7YeNW3/785K7vrVO94Shn+0F4a0ZtYNxXqXP2kZD1olwngalhyCYr1M8OWce4/AL4+ND90YnER2R+2JtfIp1VA2k+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771655; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=rjbjsR44MDeq0oXD2XveL9hV5iS6++yHo4RWCKt1VUeNXp0tr4D0gVpkReQa+e5p6QfGr/KF7jTXFVeIMEvf61+PUK/T6CZWqFWQeDJCJhArbWOU4PyEpwmcsBvV1YEt7tJm2eWW9FCxOGcN5zl0oFAwDFj05za9t1OAFktmHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2F0bXb2; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2F0bXb2"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so2311947a12.0
        for <linux-staging@lists.linux.dev>; Sat, 16 Nov 2024 07:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771653; x=1732376453; darn=lists.linux.dev;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=S2F0bXb2riCrl4ZEUf4ZQktlItmpVOwgUazRjKo0KlF0PUkoeItVNnybibemvzkZ0w
         lHGFWbNGXQSdVk8Ml653ILcUblX2496ZyFAON17yY5JPrV0HCJeki7rVn6/s6DgsmZTY
         O4u5tkdEiGf1E7fA1izGhkFvGCRx6APnWEs3wETCk57ZQ9MnC4My4TGRGGP1N6ew5rLW
         Ez9MqKbACsP3DtevliiYs9D3gaV5EnXgnKT16c78BgNh4RNr25iiaQOFqY7/nmzgtWCZ
         fR01Y5WfqGxA9tFYUI8P1Fpc1urLp2F10UMUX+wtfhhhXYyyych2sTtNA42Hl8JaR0sk
         erBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771653; x=1732376453;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=wXbohlTTAitzsJ+Jo/ff4WUKv10qAVQ/xjKxk1RFLSPt+mvZa4HR9GsjjSlLBAFrHG
         qh6FkslkYPjYv8MLWlkcIC6o1x71+px20vdQUJzir5wtrqD8oyzpf5ahY6urhl3WGQmu
         8XAtKX0vrwz+lfXWYI0bIdX+KU++NPt8hjJJb6QtWkZlpoUR+gKGj+kBJ9pUV1OeUVt0
         atBL6tOeqYXkU+M8qAa8opIKZiIx8aaKU8++7cnsklEFWFFpQiDTDbpNVzUbo9Lw0n7Q
         h57oCWTw0USvmcKE31cYXoE8LIq0i0WtVl65QtuENrJcspHjtVHf4UQrG4bAYQO6v3QR
         Jdbg==
X-Gm-Message-State: AOJu0YyUp3Xhxe7HH9KOaVFToZIZWJrPOiHENxyZpQSSZWSR4NDb+tr9
	ObrpVtc3iqgMfyE6Xe3SL3+cFpG+2TwjUOA3mtuRLMuNeb+HDZfpluCe3Q==
X-Google-Smtp-Source: AGHT+IEMIWMpX0sZKqAxjNzawrrR1PHFLZP/i4VUxBzrJ4PnK8rgtWP+hVVB9yCsGxOujxXgEOc3zg==
X-Received: by 2002:a17:902:d4ca:b0:20c:f3cf:50e6 with SMTP id d9443c01a7336-211d0ebc492mr108588645ad.38.1731771653186;
        Sat, 16 Nov 2024 07:40:53 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f3680dsm28843415ad.146.2024.11.16.07.40.52
        for <linux-staging@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:52 -0800 (PST)
From: "Van. HR" <tabulazvi@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <d7c53bd48fd6c9eec149bb67d7f4fa00cf82dd62a8f51b219171fb72eb8fcb51@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-staging@lists.linux.dev
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:50 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.

