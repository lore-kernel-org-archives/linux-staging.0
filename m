Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037B38BF9C
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 21:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608861; cv=none; b=iVNptFCpxkrnX3srnEwHZ6I74H46VZFV5ivtFV8SAI8sUFK9inI/uCJgvPBeknBq6HU6DpRHhaLpwRZY+Kcmw+H8QXF5iy9iP+Fy0yWKZFvtNdtByiWNHp054F4Kq/XEBjo6wZeQgwTyahnCaqMHNxs3yZNoMZzJHReN9SnAYxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608861; c=relaxed/simple;
	bh=bIGgBCvFzcRF125FWD09XEERO9CROlwzV5QhSXqEt1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qpsLQVVmUeFAFg+nfzP3rLe1EixPMA27MIFxeWIH+eV7foDtMqnnCDD84gTZ4ZXUrquBbrlcCh7KJReCMg49Cm7tpPT9kh1Akt2IBr/0Z0+U05E0iSwtzNEgEyEns5AClXvC3w95CwCF/L5HJfa5BkcE23NYpno+WPyemkeGWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWFBdYSy; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWFBdYSy"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6603d8697d2so1348220d50.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 14:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780608859; x=1781213659; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIGgBCvFzcRF125FWD09XEERO9CROlwzV5QhSXqEt1E=;
        b=DWFBdYSy8PJFQ0hhDtP6fpLb69ddPzTfzQInfqe4TSGM7ZY1zNSwkXb7PaUbsL/hN1
         ndg6fRKghogVAz5Jy2C6Aeg84Dr55hCXXZdyzcbq+1jetlpKtv/grDNwH9ig+Mb5ZZoh
         cL0yP0XJw5KbivdBpjKa2gVjj0XEtHe09+LiQIm7/5JaSg9ZXJvJHY2B6KMblPMFjWPp
         V1PyHnOMYmHr14wrRvyAHOD4p7KdSVwjHFhSX3iX1jIXxSkiKNl36xV3NFMGlwSCFfyE
         Rm2dSD8NZQXjHA3l+26VZ2QPeZJefRatlT7an7fwj4GWqDcGy5WCWtluJc6u0HgeeSAy
         V5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780608859; x=1781213659;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIGgBCvFzcRF125FWD09XEERO9CROlwzV5QhSXqEt1E=;
        b=ggMcYXp12bb4nJowoY6RJaFDCk3EsfdepGDKmmcBK7kqrrl3EBm5fUA4zy5biCy+ev
         FebIBjBqgpE/Sx4Qz7KJGQbbTP3WDcqZaND+qrd8EwaCGeG2n88LpXOPnfOytoCQ5eJT
         762ZD5uwPSd+MkX9kWZ48wI1jMYC22ygIyj6wrXdahCLtaqMV7UpEp/Z5dyWT7Y8DVac
         cmNFu8W+ynKCHM4rF9R3QA/b2+7VD+wuI35gMNm3NK9aDaYp2Ajf2cfqEZbJwl0fzU2O
         ELX+b/aaKXxwr3vz5sfvfiDRnZ/1NrttNXaeeRH1VnMMCW64mnqns51zWfjUENOTGNfU
         HtEQ==
X-Gm-Message-State: AOJu0YyfLpbnAko+Io4WktXgz/pt6+QapFEcW4pQBZLL29CRuHCX4Y8n
	3vI9iBYUiqC30NwcRwHt0GufZx2HhcYmKVqqBUumfEn/50PS41S3tuxv
X-Gm-Gg: Acq92OFKpIYzuxF1VbTzXuCyX0j5OEWJO3mV3Ka5exKMROCSgpV9PCHQntM8r7l0uZF
	96frRBVkVBKYEF7IXGIQjKxz7zYM3KBG2uctbKTZ3k8JBj8jdveLGLP5sKsuIdaSGH5H1xBUrD4
	/bkOrvF1YANjd3VjoJ2LUMfufJ06I8PiJI4rUhzJ2pSx1Ag6U3mUOQpWy59nnV+jbnRlqhDC8om
	0+wqxJv2b5ZPvUdpv46ueNXxSr96tUnS9XxbixtgZT57CD21/0ypu+ZKBfhIEPToZskVMHRoTJE
	1wdE9htepp5vNR8BI6HPYL2/ENT3z3eAYWXBP4P8cJvpMyJlTAYHV1JJ5ekhkS3ZlkWzAWrxAHN
	uZsK3bPX37yh4H5hvo62fGdXcecJbZ1eBph/M0WgzpzlpCT/9mfhv3Axl7KDvYrQH5UxszkH7ue
	zqV2b+F+JgZ7UzuVsQob18P07nTIBPehPmQZwtuvS8ebjj2qGWGwU86wHT8Roig2rQ5xi/QoqjT
	w1jw/dOlyR51JWCpjNI4AZOufSqVNcfXpopsag9y8J7I6wd99EvXtrLRP4Ty+CAkYUSamds
X-Received: by 2002:a05:690e:c49:b0:660:2f29:9d9c with SMTP id 956f58d0204a3-6610708168dmr570064d50.57.1780608859562;
        Thu, 04 Jun 2026 14:34:19 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d644f056sm4550733d50.16.2026.06.04.14.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 14:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 16:34:08 -0500
Message-Id: <DJ0L5OCEY7FQ.3LHBEJBW5JJ9J@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: add braces to resolve checkpatch
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Dalvin-Ehinoma Noah Aiguobas" <fliegbert2@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aiG4aDh2czwJ2-bf@koolguy>
In-Reply-To: <aiG4aDh2czwJ2-bf@koolguy>

On Thu Jun 4, 2026 at 12:39 PM CDT, Dalvin-Ehinoma Noah Aiguobas wrote:
> Resolved checkpatch finding by adding braces as shown in styleguide.
>
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> ---

The patch notes should describe what the patch does, not the tool used
to find the issue.

Thanks,

ET
