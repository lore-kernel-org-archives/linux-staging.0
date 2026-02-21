Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D6E1E1DEC
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698830; cv=none; b=mbrAu2Bo5U1AzlMbKBwrGTTJFeHO6OkePJVEurYeRy8qhcRvB1ilpBJhka92rUoYUeOPh0/yAn6970lQQ8nE59yzNJzP+HBEakXzGQnv+MP3dM634JXje4Qhy2Ee4LMr+Vqgbq8Sg09ZgYaqF0DSIRYnLhqIksXbbdIfYnmsRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698830; c=relaxed/simple;
	bh=JGuGtAW1onlCVxBytsPiFQBc55jeU7JE+89cP28qmng=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ccvcCAxxAKQCYSkraGcep5LWBLktbuyQvLOgKlKPSosP4A+4+v/a3yJ6X/mcOLjoAhlk+MCresWD99hYyDgPhMAj9Tj3MU/gZues2lCVMy6TMS379XEUJ75pTaZ6mMOYa0akZ9lTlmaepuvVobRoYZ1odr8rYJs8MuhpupbgMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjOvoT8R; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjOvoT8R"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-797d857e3f4so30081597b3.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698829; x=1772303629; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGuGtAW1onlCVxBytsPiFQBc55jeU7JE+89cP28qmng=;
        b=CjOvoT8RxxGzyIGt6T6F933wy6hc17hKnMGO09c4mZEe2xMYe2Pc+n5s/KKwO2LJdx
         bcflDHSV5sJRRgZ5QzS8lpMPa7jecsb4h1ZLMit3DyMxXU3cQNqL9+CNMye5vGMx8KQn
         xqj3EW0crRaj7UJvf2JyzP3z90ByQSaJ8vDU8qb3ubsb9jbs8pQxdKK2WcNEI1WMZJ2L
         xMm8X6AXw1m++1vkybthM/8NXdsi/qWSG0mMAF6Pcc0GyDE7/vKgoEJz3txKI9EyzodN
         PDf/MKNX4COFPKfa2+x2lo16P2EjKlcq66iAeP6TYPsprth2PEZikvTzR9iWubYFIqOR
         19Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698829; x=1772303629;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGuGtAW1onlCVxBytsPiFQBc55jeU7JE+89cP28qmng=;
        b=q6WwfKHLv/FZFK7ODKsNwYYv+zX4WVqoYBwi5XYis6eRZcSn6SWfKfe0qF2F+dAnld
         ATGFAD+pWL+tRGFwT8NvybiCqIIoq7KioKGZn4LuqFjcAppLQJwfm0w/5eLa/FUYTTsI
         gS++hqkDLAK9fywrtBohpM4vvjMgFLH5pk9GhmYUJGb3gp/BqoBxFSyTrXoFfugXwlXK
         ObSa2vJtuE2th3fyMggcsDphr+X9b+Mf7cbJMx8KqXOih6hfnwqfGmrCGFiFJ71YFnB9
         niS0TgWnCmQJCju795D9w+w9iP4Fg8xsToEuMp571K2EDbhTaQjS8z78NH3Gg8WOONE4
         2RHw==
X-Forwarded-Encrypted: i=1; AJvYcCUmPpIm8wL15+HY4TwG5bxnzphDXWzPPTC27lQEM9QpXx5yrwE6yVm7rmXYJWTHkNvfXQATcOsvoSjU0OGh@lists.linux.dev
X-Gm-Message-State: AOJu0YzOZjL3C26hSIYp1gpAjw6FMUQeYNo588nFkNr/PEH/+dtZQngB
	F25dMYTJDYt3ozPhsby1aHc419NRAZqCwmeokVT7zINAqVusz57hyDe5
X-Gm-Gg: AZuq6aJmjiNSWio51d4GOhlDT/pv8fxJOTt0NP/dTNs5iRcfQAo/aSvu0hifH9/nITj
	HI6hStIxiw42310JtTBXwW6jHQKRn8cL58MliI3EdvVJvakhGZrjc96wi7NIfuRmiepDLpPcuc3
	CS19ZXPBJA/BkbKRvik9C/KFLcY157bOMvLiyVW8dzqj5sqx4pbQ1RzeYd+lKYSMjvJDkKtX+6B
	UaZkqQPBLcieXUsGlMQ0jtRLiDJe8Uasn8XVvd7oGFH3/94VwQIfD73GrS5ahQO6ZQaMAGnVmtp
	+w6zwSmj7GQqXnxD0fHhi6MCpgiOe58cmuP9RZiGvi1rBex0MIeEuj9twTKb/U2rcVzAhxxed2R
	xmB20G8wKj+KVKNLAdOws8D18R4cDphIi8LZWPL9QzrFDYHAEEkjoZ7Hhre7yG5GgwIE/d9nROO
	lX9mzV2uToQV8K3dBUpPWxaaa1BuJEzshbHl1SEiu8GCMvnWO8559P0TenkyQOq59HYaHwAciXR
	sb7fZmp7pNHfLNHYvEuHqqqdTY8c78N
X-Received: by 2002:a05:690c:2a46:b0:78f:9801:7606 with SMTP id 00721157ae682-79828fe6080mr23819957b3.34.1771698828781;
        Sat, 21 Feb 2026 10:33:48 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982db945d2sm12043957b3.11.2026.02.21.10.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:33:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 12:33:29 -0600
Message-Id: <DGKUT94XILZC.3T4QUFDOIYD4X@gmail.com>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: Fix spelling mistake in Kconfig
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <johan@kernel.org>, <elder@kernel.org>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260221110355.9006-1-tomasz.unger.ref@yahoo.pl>
 <20260221110355.9006-1-tomasz.unger@yahoo.pl>
In-Reply-To: <20260221110355.9006-1-tomasz.unger@yahoo.pl>

On Sat Feb 21, 2026 at 5:03 AM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> Replace 'busses' with 'buses' in help text.
>
> Found using codespell.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
