Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBEA1E0B9C
	for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 00:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779237549; cv=none; b=WomD/I3AtK+S++iOCkKlXm1LSKdPRQS/icLvcJx+YTQSti1KlUBzna7KpnYbExuffuR9uk9XerZX4Z/ezVrEJJv9+Wjh1fUPuJ5T5P4PGpWSoNVr0NRsze1Dq5fYNuF9+3tcZmbvYSFh8kxT7yR+oAW417jAo6I5q0HmZxdRcV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779237549; c=relaxed/simple;
	bh=WTID6yw5PptYC1+zHDu2u2wk/DhPvrlGIAWZnmZXt+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvZ0/1G8bJnHTSVd/U/KJRRBxxyAQTMS4FMFbqxqfDNCeVVxt9tQdzUaQD1fZhItV53YDXF8stJTz5TOXtAOJQfUbAY88knLKyu4Lv262HftBrIDw/eAj3xh2jVlfDqn4EKfuQbca2IX4Wu8SXr8YKg8iBY5Mll9dSt4v7ftjtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rewsCGrS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rewsCGrS"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba856db1c0so30781855ad.3
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 17:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779237547; x=1779842347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMttTYfVsJwMk/b4c7hquJl42K/4nT9twAXaC1rfgTw=;
        b=rewsCGrSEFvGE4Myq4C5t5SKLAAZ66WybKowPbZhk5O74MpAHvZ9z5YKNzVfy9XEFT
         r2wbWNej0MfjoqkXUNKavquT94hRozn2SuyuXGugxynsJgmfSOn/TqJKOrDBzv7/XmFq
         PZ2bUk7GoShhYdU7BWeEPojLhCD3/og9eCeLAuieDcJHyViDowvek4EoBIsT8Z5Dc0kb
         qMXo5U0xlrXcpT1b/HvqsxWckduZtR94Dshuc4DN03z3QWlzEm40VxxOcLacgJqJ3kbQ
         C5MBuJ12UJCeJ4snHE9wy/AR6Pl3BTM6SXA7eT9aLv4YKnxkV2xwst/gBD3rVjx7XGog
         JfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779237547; x=1779842347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMttTYfVsJwMk/b4c7hquJl42K/4nT9twAXaC1rfgTw=;
        b=gCeEIL/kO/Bo38kVumn7+LeADPeBZYEws0SqPxBXbFc4WYAN34giUOV4fLfKZLP5Zp
         iotVPUTAZtTpkHgYC17BQ8ci9zRN3nYIopE6+BEaJXeD4giJUyu76rBP2fdPzlL0zO6o
         HaxYMFERy4qsfqEmbH8fobmzP0X1iiEBsu2CtmbmKlcQ2Hu8mQQ0dGwS4sl1Ba2Or0RJ
         uFNpGFxn0+c/WmUY6pUqx02v8hM6AJ4s+YOq/1DpfYCP0CnnUfYRVc/u2RZDhYw1HhAO
         tFfKGH8olVJhGkFjeWbqBoGjeO0yDdOIjujAAcL1rjG/iznirtlqArSUmFZraYC4PVLi
         U7gA==
X-Forwarded-Encrypted: i=1; AFNElJ+jL+hDJOHrtS769FHUKXeuRMUJSdzrPtGCBoA8DtbdFEKPcL0VA1Dcj21oPHUUPgTNawsXxWqY7zFWsmCW@lists.linux.dev
X-Gm-Message-State: AOJu0YzgNmObiL7LSL+iRCn4uGeyMDLpgALlSomD9T1/1TZx60t1GTZA
	iyDy9h1bRY6s+usWMF93j6jVwveN1VbCclVbsFpW6M32JL2tEzl5lCcni86rlw==
X-Gm-Gg: Acq92OHNQSEMBPUHNI0oTAnRaYwxG4JdnOFftEdmCy9iEUCjOssvnfUApQqs1G1BJ9n
	BsF4YcG4Hx5Uxw1/d6FNK7Z94VrVBZJsvf8IiR+hIsJToJD+Dps3aQ+824tFmRoHkrbn8mF4VNw
	7adUGgK8OwPZhlwDGIzf3L7yAlTkjZZ0IGP/ctAClizhY7JNqpojWxxmgvF5pxV/kkYcwJ4/h/P
	bG58CWefvI67xuPO+0Bxan7d5FxmnUVba8RzLltGk1g63Cxl4ZS+lVRO9bUvLHJxIwQ5ApnkOiw
	VFYq5X4VKqR/rwNY+kdw2Xduetod6//fhW35H3oxLI/5BL6h6T86yF9FjbF7Zq8ROfBz7uBbveZ
	x6jNPT/QkWx4lMkrV5cKdnXk7on4lpmK9qPAfm8ldf/4100F2fMLqM/KMcAmnlAVCOG374ag5gR
	oGYYEK+beYusTAYXmBJtVUklBh87HA+wnawSNFaP2dzg==
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr236662285ad.18.1779237547374;
        Tue, 19 May 2026 17:39:07 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:347:9864:7116:e114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5ef27sm254756255ad.8.2026.05.19.17.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 17:39:07 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: gregkh@linuxfoundation.org
Cc: debjeetbanerjee48@gmail.com,
	dtwlin@gmail.com,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: uart: clear unsupported c_cflag bits in set_termios
Date: Wed, 20 May 2026 06:08:46 +0530
Message-ID: <20260520003846.20766-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026050413-smell-ramp-e2a6@gregkh>
References: <2026050413-smell-ramp-e2a6@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 4 May 2026 16:15:32 +0200 Greg KH wrote:
> Has this been tested?  If not, I'd prefer to leave this as-is until it
> can be.

Hi Greg,

I don't have the hardware to test this. The change follows the same
pattern used by other uart drivers in the kernel that clear unsupported
c_cflag bits in set_termios, so the logic should be correct, but I
understand your concern.

If you'd prefer to wait for someone with hardware to verify it, that's
fine with me.

Regards,
Debjeet
