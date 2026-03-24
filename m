Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367C437B3F1
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360564; cv=none; b=hXlgBh+kePH84X8Xt7UZBqV+giJCKkzaxARKbgan50NrGg2nBmdikBhpr5iE2qJe2OiLYDEfoaxI06Pth2OKwZgTzzdmQgClcerrIFZ7O49if+0qbdf+XWy3YhDSEor//vZJKs8ViG615eCx21WQMWWhJk/4ebH11hO1FT6EYwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360564; c=relaxed/simple;
	bh=4a7RiEXSFl58aUqN2pNP8plhro3QgyB7N8+hwXQSYE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SowqxGL3ts+KhrOYhgKNCUE7xBBFhUiNvx4v2MptZAwoyIDPZiUH4bRdLGTnba5BacXc7/ucl6M8VJ3Axkw6jYYxrBp8SQYBjWjqtjwAAgu5r/USuCZ5ioFL30s0l7BJcyHnJDDhDpHYG7t2LcBu+TK+yP4K0jneUdbL5lzVqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyhogFpr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyhogFpr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so2994948a91.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360562; x=1774965362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dN+aBFew5lVv09Wy89w96X5Ub28BrldukDzSxi3clfg=;
        b=kyhogFprmmzf0OnUNMoyjvgejLJXRshfO+LAYVeKQZlHzNY/XCyCLC9GjYVwoOaZK5
         nNU28tkHFbHxKquoaSW39Adxoo4UCFX+C/Tjni84o42AivU5ZKT5aKZ/PiiP2//lWt56
         9thxQCXXesHq8z4yl1SZUGjdukWhT4xl0WumwwRGj5DaFWY2ezojOKn/B7JxglUfW2jE
         9gKNjp6F8QZqQPMqQI17DPU9+ZslVH8H6ci3tdp1wntguXgWo9Ct0nla45TUuSjXXPEF
         ABIRk+z9usrqHoeBj9sdCBNKc/sEZ32Pe9QryjwQS9+QnwzZv0rBDdyzSrKMMUO7mTkT
         0l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360562; x=1774965362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN+aBFew5lVv09Wy89w96X5Ub28BrldukDzSxi3clfg=;
        b=VxCT1P5elQlUwB8Mx5Zj9bQCgEV60N4mYEs4I6C+KW6dystDecLbF6QEHPCMeGGYSe
         W1G7WFrpgI8GMxObb3B5998BDDXMaAJLb56mMIh+GWE6RjfVx7Oekf5cYsggAtSPwllV
         SNMJ0StVNcxzHsgfo4aBHdFvCCprI5ku0hV3ul3HY+G5kl90A799Jk+Yhu6YmGE0LQye
         Lw9f0TdtpW2whEAA2xhJpsuOzYA76xJZtueDK/a4pKSIE5pA2roSPvxwrgD33mHOYp3a
         V6Dj2UKWsriX/2UM6z9gyR1kpMmwaSEDRb+UBd91SCaVTO2NlsFw2m5n424wSLBWNJ+K
         0+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtWn68rz+0d3XfqM3vn2cE8dhtlyZx0nwxrqUb7RG4RM1MwPacOrTh1ATod2bkuNu/iD4El73xnSNluygN@lists.linux.dev
X-Gm-Message-State: AOJu0YyAJg8pspjs0I+qwDu53EXEBdh20NSEnL3lT7C12oZ28fUzTiYh
	n/UhSI2/c2ZbBYnKfKuPfYuk0J3lXBnI0gm+R+DmEdFiEFZ7+65eR6kL
X-Gm-Gg: ATEYQzzTk77jIefUd3yQRTHdnxqcE3ZTEzusHflXAw4Aixelnk+T8RiUzALW3bgr2kW
	V3xlFoC4P3AfZc0wyfBp2LjSbXoVa7QTIrqdRwAavilavmxWiatopqe0P1Njpgt9+EH/VmmUGya
	gfAwIyXZHxUgCTbfr16LExGKNOqMGuGcbRZl90bnHGgg7lDjKcPpfeXPPOT6v6Hp/6b5syq+ZgA
	KBCIVK8JenHepPgAgp3T82IY7rgV/L8R6xKzyJtTjR9MBx2r8Rtb+EF/RSpNRDGwbGKC+b9IvMm
	JTXhnCFC7ZkSRdogoQcwDxDmjgV6MITMHX62bL3l4nC57lQdL+0wmm2/CSFXuZaQ0N1cQJ7CGqz
	415MZLbo9BsHxQt1j3QtCYurXBMX+zXTP8MWIk/XvLyiDiphGPAiK1y3vlBcUtPOTS+qMqApK1u
	cR9yZPAnuHSt0cyFSlRMjKEw0=
X-Received: by 2002:a17:90b:3c8a:b0:35b:e594:5038 with SMTP id 98e67ed59e1d1-35be5945433mr9072510a91.17.1774360562360;
        Tue, 24 Mar 2026 06:56:02 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a8186efsm10357323a12.13.2026.03.24.06.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:56:02 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:25:51 +0530
From: Prithvi <activprithvi@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	lukagejak5@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <20260324135551.grth7jfjyoh5krzr@inspiron>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKU7JjW3OFugHXY@ashevche-desk.local>

Sure. Also can you please guide if any testing would be required for these 
changes, or I can directly send the v3 patch?

Thanks,
Prithvi
