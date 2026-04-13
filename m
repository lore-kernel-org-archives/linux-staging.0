Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F64237E306
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776113467; cv=none; b=ic3SrVwoqC12fs7oJrPrqi2pBhx8naYdaF/cntt90oBZKBsb++VUOC8i+xVjirniC36aadG79GvqF/CQNCXjTIkxzRLtmb19HNBlbUtaxrTZon5zhy7vviIR9lQ6BfB6P85VAL7NgQXOM7ZlcXRKZjuBF/kXFH+AlAizw7fRCWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776113467; c=relaxed/simple;
	bh=cnbQBSjLnHWJEvo6aqTOAK1iCBaP7ofcCP4VdTbsoKE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=unFW1P5JBPCmUwCS0ky5dlcy8Oeewv3kOapXvbRwdXA1D/V1NAHTlOF2HFrF4UTYs6Mmg20wYYaAjWCySPbXENdyB45FOaB4D24rlzxDYl+B6VdAasKS9rAB9CNO3jaM5uUQxohcVotREvdJAKfXJ6DJ62R9MXv4JAHOCVzwCuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1lZxr7v; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1lZxr7v"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64d5a7926cfso4438173d50.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776113465; x=1776718265; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnbQBSjLnHWJEvo6aqTOAK1iCBaP7ofcCP4VdTbsoKE=;
        b=m1lZxr7vvBYluqetKMU/iXXwifADVR6eq43evluabkrqnHzbSVgK7/u5jmiBbjOBBH
         32dwDFDpn67IOSN5QowsmPcILch8SXjqu8EnX/J0lqBNA88sfXEGUIpe6vafzy5qM06Z
         0SPkPwmVK8a4W5+0FZkJepFVIICq+1tLPBe0rSxPPuqRW8k7YINwC6OT4RM1s1wMANn6
         DYCAzlok0km8J7PnFadMdjlJgmwQ5FZgbJ9R/j/rGI57kW3PIUOma2ZmA0XmpXWEeZUz
         gZe205Wf7QklAL1xQnOiROjql2NAMwUCw8YiczSZa6qwntx1NwuoL1hnhNPA9AkEuxdv
         GvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776113465; x=1776718265;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnbQBSjLnHWJEvo6aqTOAK1iCBaP7ofcCP4VdTbsoKE=;
        b=JSkzVdJ/fVIhvX46pQ3uj0DsZ+xdu5oARnbDOSvIenTig7ecOq1xqutFyx6U8iabDh
         RccWdK8Ud+PpR4/WQzV5ZbCxN7sNf58azp5pzOw/pEwWBIHtGA4cRJiw9cNP29+iZc7u
         1Sk2DQnBq2NnQeM0e7488kwmOjXdmbo9f30FWs5HRKV0Rjhi3nYZ+2Oe9fVqRPZIwN3N
         OLiWZWYm1wbUQ9SVP+u+kSQTUXNC6BmXHaIxQ97z8Oqt1FWs5jY2PVGo2jRau6wOsww9
         D/oQEedezPFoJZu+8mXzYqBBeLeeLrfWZ2YlW4F60zxj8i09owtbb+xoxu8nIzAu7EI9
         UQYA==
X-Forwarded-Encrypted: i=1; AFNElJ/oAWSSWtoHclcnPNE/flEq9VpHbTEe06zdBNvBw1q4qLqKCt2fRGH7lnQOBrpl/K/B53xkKND4vJwDZcii@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9yRaFtd/hGdRpBdnVZm3ibwusKfgDyCU/NgdTDBsBwGCSjSNQ
	YoYU95dXW/NXUrWdvmJne0n+aG0P+iq0e9fJWlqKZDZHd1btXaQVJ3PU
X-Gm-Gg: AeBDieta5K2AeqveXtJZdFbVjf0VzFQUt1gAhyPEx1/8vhwylWGaAtua/ktm/n3B8wQ
	cj6ZG2cyKbp+FmoDvnXQJbiqwaWFYqnPBUDNntNpw+3d5JjEBg0Cb6CqSc2wZdbcfgUPBZKGuZ5
	PdFVc29hmg70m65c5wf9pfRLO5IrotFAhV4qZimNvn35dzdB/JBxlvSxZyvMheo5FxBp/+yPNiA
	DNK4xQlU5g3CZPZdJRr/iXf3Va0NSbNr/odJh0mn2TO008Snm1BWCe5nawziMIWWWLVdpEK3F/t
	DbW7fSW9kONNT9uegRFMfyJ+iRARSSEeKAXxbDStmmrWvhjftQjXE+LDx9o+nPJFp5rjiqm8NBQ
	iVmSHPfaMW/Gr2b5KAaTvEgJyjOlPocEHdZzYtsQsL2UvuY5mou35PFPPgebzSwSDvXpIW3XyFg
	55F9BbZzXx54RNHoJpQ3AeCopVLL+WaGxQ9ktqoL6qj8/xlsG3w5sUTse89SJbG4MohNr0htB7/
	+VWlA0tlf2xeDJVQ5GZe/aEXi1Go5P0zz2h6GvBJ3U=
X-Received: by 2002:a05:690e:1243:b0:651:c468:99a2 with SMTP id 956f58d0204a3-651c4689e9dmr5172113d50.45.1776113464918;
        Mon, 13 Apr 2026 13:51:04 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-651be6f24c7sm2737730d50.6.2026.04.13.13.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 13:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 15:51:00 -0500
Message-Id: <DHSBOBFQ3HZK.39HN9XAYE4BT1@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Shyam Sunder Reddy Padira" <shyamsunderreddypadira@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <nayana.mariyappa@gmail.com>, <s9430939@naver.com>,
 <andriy.shevchenko@intel.com>, <kees@kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: avoid NULL pointer
 derefernece in rtw_cbuf_alloc
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413180803.72647-1-shyamsunderreddypadira@gmail.com>
In-Reply-To: <20260413180803.72647-1-shyamsunderreddypadira@gmail.com>

On Mon Apr 13, 2026 at 1:08 PM CDT, Shyam Sunder Reddy Padira wrote:
> The return value of kzalloc_flex() is used without
> ensuring that the allocation succeeded, and the
> pointer is dereferenced unconditionally.
>
> Guard the access to the allocated structure to
> avoid a potiental NULL pointer dereference if the

potential.

> allocation fails.
>
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.co=
m>
> ---

You spelt dereference in your subject wrong too. This patch needs a
Fixes: tag.

Thanks,

ET
