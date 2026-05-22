Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9645E376A16
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454950; cv=none; b=j6MtVvY6xM5CZ5uXq4ZqNM9QL+oF9w3KRNuREVcWjGkFF0y+9fzSUYeKZBGon9rXV0XioHLYTUHDlILTDW0I9ALpDzOyGwEZtEQujUENNffEPiQAWTIBvTi2kFTSDr4mD8HzCq+wTXziA07mG9NnHd8iHjWwfGEsIVyUJPbpIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454950; c=relaxed/simple;
	bh=ccygB3dG3vejGuh3+hr/AfQrEKLSN7zatCa9htP3j78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jm8VmQ+ybcd0Zv9THS3JBiVPSN8W8gFsouAKOuxTqnEjL9igLKgT0v/QtRjLK5eAKrqKEgxS8z1D3Msd6G75y206fUtDOzohP2QygNIwpBeP/SGiUowZ9opL+AM4oQp85QuDnQmvjQXVm/ca1dDkknHUXyCOyaSAq3hdQ0nymn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAx+aCyG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAx+aCyG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so5639555f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779454947; x=1780059747; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYYrriCdFi+xg+8zlvmuQxoEZyLGrGd+qhT3SliGY9g=;
        b=UAx+aCyGd08zjl+U0eK7BcHKMJTXKDwelTNa44uvdPFml2sCbqH2Py3A+FIrFFUrFh
         68u7b0QGp3x98s3gtJX2e6nPGh3bWuH8zHPxbJc1nZBe5cWnpV2bB0ySmozc06Eor75s
         0nJuVBvBLzrYsDTlVSjaTVhzi6muojDsLAMUSJGbnLf3xb086i4dv9bo+pZ/eG/FSqME
         DxNSdKPs9je3RwTxPgj09U1pucvM2WRJF5aZgpYJPrhuMCtXBJuXG0qhycu5Vj+2KIu+
         2hZll3pv1OqLNnvbwNjnfwG3rtsMynKa7ysv86mg5bqHB7EUxi0K39GPUEu+DunLxP/N
         YxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454947; x=1780059747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYYrriCdFi+xg+8zlvmuQxoEZyLGrGd+qhT3SliGY9g=;
        b=OAP5xw7Vl5rD1VJKunZpw2Ydl9bD5VQuDIsQ7WnmmoOOMsfA+WKYRLiS8bwg/K+eUQ
         HPjQRviSdduyRydWZ2N/lDWp0oMceHSRbY4g3GPM8ZCA+5FEL08STrSoi/bK0/IhijpE
         LJExAQ+n8msDjDkB3qE9AGFaK3a+o/bgXPFMFkX802ERVA+c4EaRNP6zZW3+A9URFvSG
         cso1UNe6F8KZ8E03z5Fv/67me7k+cYmWugBK1Xkm7LRZVKX/lj2wVa9n3SAHhrqhVWBP
         H0dKBT6g3ffI/4CSgW3i1EMQ+o6WMRBwfhJfRfmwwBPH+KwaA/ZsIhfG+CRjprdvS/3I
         ZWwg==
X-Forwarded-Encrypted: i=1; AFNElJ9Wf+HoqTkViErhv0JpAOKvU/yJC0TfpDQIkU//DRf6exHlGBIwGDcFYYaBbs2q3S0+8+U9PLb6stR+WuPj@lists.linux.dev
X-Gm-Message-State: AOJu0YwxXdtpRiisQqjNtp2ZWE1pHMsA+wd3MY+8zM/Tdd2LCQ50beNT
	W6GFXD68Yp7qMw0aPRubOGijFpfoirpVmIJm3ZDOwDfxQibDJU2yUikU
X-Gm-Gg: Acq92OFZrQXxozYKwnWZJOfUCsBY+TZhtSh27SxR36SALWapGloh4IFzsQ6bpGv6OfP
	yjfz6OR86x5u1Qc+eXjNYJins+9jstlRT4JcRgNgj3pA+Tkb5L7y4PjA6MTv4DXga3JqvFbm2no
	BvpMXgWQ9biIDTBWj/Xz0N8kWU1WxgmNTmWZyRC0ewc8nv8rFXI3BowbG2fLhuIPGgPqcWeysoj
	+JbYxvwdWhllioyjEO5MRuSqVs43qNxz8AhIEcX/GM2TKcrtGD2s5WsEtH8XKw2oul+ZOwE21e+
	Gt6IA60Fs1cZO+08FfjHaLIIZmpsVkes3eVlV7W2aFv+RM4fLa12LwF0VzWnKK6bzJO7cEyo+Oh
	B27pmdE4ECKEuHc5GFPSVdh0QOUQx3VhhybAOd4dii89HZfrXod4eR+HiWGBcr0NLE/Zw2/BdVh
	29BiTshOF0naaOZ2JbqBGB6hdEw5VFzamGRA==
X-Received: by 2002:a5d:5c89:0:b0:45e:89e9:348b with SMTP id ffacd0b85a97d-45ea3138df8mr12777136f8f.7.1779454946784;
        Fri, 22 May 2026 06:02:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70d89sm4345189f8f.37.2026.05.22.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:02:25 -0700 (PDT)
Date: Fri, 22 May 2026 16:02:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] staging: cleanup of sdio_intf.c
Message-ID: <ahBT3r8ob5Zbq_Fc@stanley.mountain>
References: <20260522114317.189368-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522114317.189368-4-manuelebner@mailbox.org>

On Fri, May 22, 2026 at 01:43:20PM +0200, Manuel Ebner wrote:
> did i overdo the split up?
> 

The split is fine.  The subsystem prefix needs to be improved.  The
capitalization and puncuation in the commit message could be improved
as well.

regards,
dan carpenter

