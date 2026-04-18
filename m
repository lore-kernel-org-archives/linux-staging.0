Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54830ACF2
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776535704; cv=none; b=JhWqO8GR5h9vPd8FtTNbfObLo6yQ6VIX1k7nquOXeAULIrjgtVEHE8+1J/y5xlUOBNARSQCvyJNYhDZ6hvCi3KmhK3Rfm840Rdi6rNg3L9CRmIhr5fH8Abu2HGSKwRLB9M6x/Ud5OzaRKNHfWVyQA3S2BQV1RX7gaMC5K97jORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776535704; c=relaxed/simple;
	bh=2trTd3fdGlD0hxN+qhonkbJwHRvHVHsnX1K3ohuruSo=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=ZgfrGL+5BweNqRLyGbZWXGQc85MTthwWBHs5Vt4ihrpwMGFNwURpB2aWPhWqIGyBBkIDD212bwEQ4k6VzF1NlifMxMmAYJsty0XH9pTm6yGdbIh72N4sPyi3GYQI9xOt43j/dfGLQMNMIPPav1Gacq/QzDs7RUR26Nju2aN6gVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxqOONLW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxqOONLW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1425346f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776535702; x=1777140502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2trTd3fdGlD0hxN+qhonkbJwHRvHVHsnX1K3ohuruSo=;
        b=nxqOONLW7vEef6hCkfZYi2ey0l2FKFyLFNCjZK/78l5Q495X/dd92aRfivsWuzo3sh
         Sl9IA2Jzu6D3VU9K5yxUMYBVqr1K2Nm2KtSBkaDFzQfyqGrQboR0j+eN0dO5fHCNAAc0
         M9iBUtCxG2VvizSlKkMrIVxGnxvK4X5xuX5bRBdOAAvpgYaUTqYUjHTRsmN3X+X02EyS
         iKhUf/trbMcCz9RZhB5IHD/vcWaBtjWWoCD3/ps8QYtBvpG8l5uvax2SvzSSGJ1kwbnY
         TOQLeckC/7jjf+a84de7Fm+4f2WDW2a2Hv0To8FhEgLq/XkgKIVp5XfaopX/P0X6t/h3
         rfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776535702; x=1777140502;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2trTd3fdGlD0hxN+qhonkbJwHRvHVHsnX1K3ohuruSo=;
        b=F/bFlj5ouYCnrrWjfrYsHlNRZDkUSP8kEULie/wwswrdKBteCR9/RlTaTvX5+vE25T
         bFwRvmUGX3m3UsZj/e1a0o9efbid0x5WHe7G4U6Qss9DVagVCvBPTK7Flc7j5Hy/PEMS
         cj3ZphtdLCIdLF/om4CvPRZvf69dThWBhJQajIhFeauwBTAyfk5TyqTQThxrhXIyNFFC
         +rV9VsNDq+kzgbqMn9RxylFeWZBRky60puGWnceNt4W7n/i667PVq13ghaATWX/7I1eD
         ur0J4IbN2cHo0nfpqyg5MOLq+3DWpcfT1d2fhCs5G8UpoPUFG09a98hva213/nqtnnov
         2VzA==
X-Forwarded-Encrypted: i=1; AFNElJ+d1RWagC2Jp2t/HwLMYB9pZvj3iRWyuhNmVvdgAOJnzD9NnIVQr2Py43BZI6BJgQYKx+ikQWGhSF7JPDDY@lists.linux.dev
X-Gm-Message-State: AOJu0YwhY8Vp3lPAElhGk66wGnqc4BdiH8OETxo2b+RIMFZFqQxNSSKj
	IfDRRQR1Id4cG+mbEcY2h3Rjp++Ht5j/F8RBvger72Tz+XwJIfRbXRjW
X-Gm-Gg: AeBDiet4DwrxZxS4r5XP6iT5zwadkv0muajA4bOO1rjB5M4Bw1bjTujEJLxkXRaLJZo
	8Cy2BAPJMs8998I5HulKUOuKTNaU7fVobrdkP6DltNTjew+BpK5ynIDjC7OR1imRV2FZPSoPENp
	WYbKDnbdyFcMtzSOBNEEq4YjbO6Q5vV4KTc3WuyxiLmhBvP/KkR01UTCAQCLet/y9LzaeeGpwFd
	syQozOPSrWn9m3HFYP8BgI3fFAfbwNYt/9cf/g7Y1TxqE4O3NXHZ96P20GumkkxdzxqnkgD2ylm
	AroVVpXy46+hhdJw2qWCifBmlwCfsLQ/yvnD3wWl1vnnqDUQLRvTc7fk54ER5yI7bzWxw9WJXyJ
	qH273Q+3ejEDFm7BmBQ1hB2itWUkVdgRNPdibb6Dq2RcSug9XZB13kn/I+v/MRLa6dhQl1PaqFJ
	3+tKv27z+RaHIREBWqnXw3ZSJFuGqq7FzZv/vCN+ElfYpHxgVT
X-Received: by 2002:a05:6000:240e:b0:439:ae2a:755e with SMTP id ffacd0b85a97d-43fe3e0b606mr11670634f8f.23.1776535701349;
        Sat, 18 Apr 2026 11:08:21 -0700 (PDT)
Received: from ehlo.thunderbird.net ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm19929516f8f.36.2026.04.18.11.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 11:08:21 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:08:19 +0100
From: Josh Law <joshlaw48@gmail.com>
To: shyamsunderreddypadira@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_os=5Fdep=3A_rem?=
 =?US-ASCII?Q?ove_unnecessary_braces_for_single_statement?=
In-Reply-To: <20260418171904.16479-1-shyamsunderreddypadira@gmail.com>
Message-ID: <CA8D0957-6C43-4706-A2F9-4FEE20C516D7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hello shyam.

Seems good enough to me

Reviewed-by: Josh Law <joshlaw48@gmail.com>

If you like this file, feel free to check the TODO file!

(I'm not the driver maintainer or anything btw! Sorry if this is
disturbing the maintainers or anything)

V/R

Josh Law
