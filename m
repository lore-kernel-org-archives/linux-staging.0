Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5833F8AD
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 22:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190120; cv=none; b=jVc+2NxdCYMz2O8wJRXG3wD/zrXPOgyLhOQlJ5bYZEWvo//esumBYpEY+8pUdceDVFPDmZnMA6E6NB0sxdHu1gmdN3vehGSCWgMtUgqfpEhow9V2cy3uwIJ1wOnZsWfHZElDUVIJWvoCni8UIIwYLTPOTqojd4PJOk2b6avqSQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190120; c=relaxed/simple;
	bh=MZ2Rq4/80Q7iGewMisCrHrq9so+ss6+rUrfgmY5SqJM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Nknvxvh40axu3onWfQyLCUUi8xd68jGS6kpPie8vo93R1e21QpnA2wZ/fYMWIJjCbJRutsCUuZ+81rcNt0UF1GU/Bh5ILRGTdWSL4dv2C4Fyp79q9QB2nssDP4WblyywHl+nBaFqIGK4PPamSoyjC6nRZz2LbULQJjmJ6YzifNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CldxH4vA; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CldxH4vA"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-675617e81f9so479422d50.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792190118; x=1792794918; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MZ2Rq4/80Q7iGewMisCrHrq9so+ss6+rUrfgmY5SqJM=;
        b=CldxH4vAsoGih5swVsceWNFbVaHzRrXvoqB/x4PV/STHuNyD11FdjDY1WZE3JDOR9t
         eBS7YtILu81wYlksoPo8Ud4KgW1NdSA5YoOZiWwRWa14U6QNzFxxE32oIYLnYlMGugIu
         WJiwi4wnr5J60ImIIwpYUVxxCR94vi4Mnnr1I/0Mqe0e3kTA0kDJhdFS//GcQVXY2Jso
         GjP7tNBO2sqVWOZhKhRXazdUCAoHVUVhB1g4Za7C7xdH2tJgjuvyQ73x/bMpUEZdSPg4
         374iJfbyRPrKgTKjEc101p9NAPzYKAnbxZIze5X4kV+XzeRSzLYdnUZ8emSmVDjSTg/y
         D2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190118; x=1792794918;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZ2Rq4/80Q7iGewMisCrHrq9so+ss6+rUrfgmY5SqJM=;
        b=M3Uyjyk9BM/eSOPceNqzR4q3lXgYPp8XEpMQ0mt0BzSKBV6qARNogOX3ae/quts7Hw
         9aix58h8K7oInHO71mE85hHS5y1b3VaqmLeVq3GeJezP5xpU0t//rkQo/6ZSF9o6VlLy
         UwLWbTW2Z7LUwT5i2CZzLXABdhb1HKXkxkc0wjOVL/omeX8guloREwE3fF6CwuXYGmQ/
         jTiPmZ40snuFvDRro5ATVmqpD82Nzq+Fm9UPA1q7P7fYxtgzmhW41oJF1X8B3BmvZ4v0
         jTnbl/3c5n7ERjKWpp0ndZ+H///2wxGcYECnS7GzUwxiiX6ERirzV/MXW9UxdELK6EGg
         p3qQ==
X-Forwarded-Encrypted: i=1; AKwUvByfHKUSRrMcHjptNI+amoK+1ir13gu1R7W/grW4t4P+UsINP/fIRzzwSX9M9H8zfQydOQwvv1GzK2YX2dtO@lists.linux.dev
X-Gm-Message-State: AFq9FYKJHg9Ewz+HCfw3ogWN/4lwXgVZV+kPAHNl6pEpsMrcFtWpDncQ
	5u9d/nJXoW0Qg5oiQ3iHz+gT9LJQlyT87vVhjco41osE4RlLqsMej8w0
X-Gm-Gg: AYBFou32aBLZTkOxbwSq3yv6cQyUUmToL/sixQAU0zjNBgucYoivXdM4ESF3fia3Lpo
	kTbGdOQ5XFliyTm4a3LMVGt842PoJTATaGEbbvanowNvgQqA/e2HUg7+iZxghlCU8CLH22WT6b6
	Gm0+evz22pBNpdLUXaJum3nvxn5t/w5yB+qNrU3VNWHenz8G/+XIw6p+Ph2f7ezTAoemiMGinxo
	G965p6kjDMiqXAe9ws5wW4XEaKsyyPivqQ5dyi3H4JPe9myhkKhhtySn7x1UFE2W59k6rb2KKAz
	YSGdDzcacZ47iCmK59EkcO+o1ZxJgz2QH1O4wRcbX4db0jhXfJTuJ2SpaMFlVJeHe+mhIqdDzgV
	8pRobgYBCiXLYohCrTkSF96f9nEHOp8/oJna7pNA6nNDgMQ+ftnMs8ArEz/HNupKK3bjp9tchAE
	0wNRJ8ug4FDohqdGxX6CWoo3uq9zCxSgiZebdgVMFC/fXtJI0Vyyt6q3FelOvRS5TeFZI6NiW66
	Y+FZOzHQOpU5yTMHxHc55h1CgvODbSgX2ngcmCN6Sh+f5FLFO1g4UGsvfXRM8AZ3giAiisg0d0w
	jaM=
X-Received: by 2002:a05:690e:d85:b0:671:70d1:d6cb with SMTP id 956f58d0204a3-679ca7f922emr229592d50.61.1792190117971;
        Fri, 16 Oct 2026 15:35:17 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1eb0b6dsm1651282d50.13.2026.10.16.15.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 15:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 17:34:44 -0500
Message-Id: <DM6MD2KJ8KS8.33P7OXVDIFUEP@gmail.com>
Subject: Re: [PATCH] staging: greybus: Align function arguments
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <pavankumaryalagada@gmail.com>, <pure.logic@nexus-software.ie>
Cc: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>,
 <rmfrfs@gmail.com>, <vireshk@kernel.org>, <greybus-dev@lists.linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <outreachy@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016063648.22795-1-pavankumaryalagada@gmail.com>
In-Reply-To: <20261016063648.22795-1-pavankumaryalagada@gmail.com>

On Fri Oct 16, 2026 at 1:36 AM CDT, pavankumaryalagada wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> Align the function arguments to follow the coding style and
> improve readability, addressing the alignment warning reported by
> checkpatch.pl
>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---

This doesn't apply. Are you using staging-next?

Thanks,
ET
