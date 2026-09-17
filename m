Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284755304C9
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664472; cv=none; b=ClhM79K6rx7lHKofpSZDmOWmz41Z3HdFeCSCJpMOkUbchkVW4YaRKha1jPnfIBWMg5S28hwgH3y6b8c1rYZI4OrW4nBzajz00iSpLsrkkU4+T3MmZoJqvc3SajmqvcfBXJe2JH76kYZCjhidyuWqgSYShU4sAhbtqGM/K9zkyeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664472; c=relaxed/simple;
	bh=55CtH0fbZAzikPsEz6XWao1uKzcG+VvgI4ZlHllnCxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPqgRp5Dkme5cpR6Bu934RuNUUF/3OdAzlvxQc1KlIfflsTHE2IXtoC5S2nDfUc5k8ccZzjeLPPJOVHtpAF4e0wopCC7MzTlWCnUaJbpywXimno5YfWwUm1sKne9LWCyiJhWQVlOiNxBrB+NKDXM3fVVCErN5xjQuBETPjlLkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3e/EK6Y; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3e/EK6Y"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1441439e87.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664469; x=1790269269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvabIRYgCeoTg/LgMnCJum3NjuE2OsiV7HRI/rmr7nA=;
        b=X3e/EK6YJmnaz5j7PJBAPbJy9guVF6y7VWq8U8Gm//vZ06OSrjDK+sNTFBdJHLoTMy
         L+WbTDVAuEAcWMyw7VxAWhbjQGGnfYfR+YY43Wu8g98icBx70t4T533mWl/ltuu+X0zf
         N+hDBap6SOT9MPIclFCgco1SGF0OcXkUowxJS3XO2l/7QN4rP89Az/Wdy+DU8jeQzod/
         9vWa8BM9Z1zmqjBRsZP7TrUwFWPoYYpsiqZ2KVX2iEho05DUBmXZqeSD40f5uXTo1uNd
         KbZnD69QAVAC2iH/9lVm+YX9GwMrbLQYl7aRSQdpKhhEM3m9h2dVUSGn/j24Eb2psXf/
         DhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664469; x=1790269269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvabIRYgCeoTg/LgMnCJum3NjuE2OsiV7HRI/rmr7nA=;
        b=HpwLQNSx9AHrxFa33/WyyLqFqDZxP8AyBYNG3tWMByR0AEmMt64/kd5O24hoBA+5vV
         V+qtoJS4IZ5oShaGqKF3MHgXc4tw3Ag7f8AUSzlCKc/t7vdOIr92uyc4a0Qp9GMspcV7
         mf44InPDGxZ47iQTA+uZ09lwM0/64xvrGf01CqcvsATY24xEqnZFh2h65GaVjIEyTrAt
         7Wd/esC9srizzzap5H5mm20dUPTNtACUOAS+PycIafUXvDs8ylUUgEYHASAdmowiCK34
         cqrlxtsW+n0Fcckk1A5BL4qj/1dolXbRaJRrJJqdJMOqEVBKAi5EgpNwrAFWf9hrL90Y
         iRsA==
X-Forwarded-Encrypted: i=1; AKwUvBxUTFmsyl1YbEXdyeHpF0i3Tc2Xs1SBk7bdEz26KpmgjtywdZs/uxH+FZ5JVWODZzkvizdnEtGCRw3YszkD@lists.linux.dev
X-Gm-Message-State: AFuF++mY+aBJMol3Rd+/aM8G8Tq/KHZXcZpA/U1MMDTsYSCitihIMkvZ
	ZNKRs9eoJ14G7ihIUnIHpp7lvmExi6wi8+13N8TuPv+4SOYKNZryqY4PUCWCftXd
X-Gm-Gg: AYBFou19cEs8enBzYxRrmlR8M/W3ter6L7Ycj0mdNjHXrHpgaqYr1IVgrITJem/m6B5
	16C7Qukkl+UhnEmbOgd61ddP6Zzc0KgTeQa7UxERxFWbp6DvqciBvOqcAdKna3guuJ6cBlGwWXJ
	xPzqzqF1HfVeZ0JdnGaDFE2z9e2kOGkcu/bv0Hfkk8uYbLTEhO8zk9m73avnWCj96oLn97G3wjq
	EC5UM/hmZCD3UTTuq0LK5JhGCXBB645LMidRJnfUgU/cNT8dZvoDQC7FwRgKgL0lypkYDBt5asU
	eazb7ZKhjNLgPRmpnaHTyNFITpATx8pcMaGb7/RE6nkYxQwqPZVFoJCG+5aveOVWwbNVu68ThN0
	6CYF80a2BDqRJ45FPZ5JRkGwGvs0SObLI3LZuEH70RmDaHt6twCXAUgkvErLYBiYjjcO2BI4VAj
	bfUvLhaLH3+93ifRDsydcFJbH43pTj9+t7IiRcvF52gmB1prdDYZGeY7UZ75ieFl/GCElPU6V4M
	v/C4g==
X-Received: by 2002:a05:600c:4e46:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49eac467939mr79863725e9.12.1789657786255;
        Thu, 17 Sep 2026 08:09:46 -0700 (PDT)
Received: from chicken.. ([2a02:2f02:5101:7300:44c:8311:3d26:e514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm96906755e9.3.2026.09.17.08.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:45 -0700 (PDT)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Matyas <matyasdaniel005@gmail.com>,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Date: Thu, 17 Sep 2026 18:09:37 +0300
Message-ID: <20260917150939.477489-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091743-sanding-shallow-2472@gregkh>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 12:58:14 +0100 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, Sep 17, 2026 at 02:48:48PM +0300, Daniel Matyas wrote:
> > From: Daniel Matyas <matyasdaniel005@gmail.com>
> > 
> > drivers/staging/axis-fifo/axis-fifo.txt file described how the
> > devicetree of the driver should look like. Convert it to .yaml file.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Daniel Matyas <matyasdaniel005@gmail.com>
> > Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
> 
> Why twice?
> 

Lost access to the first email temporarily. Should I just remove the original email?

> > ---
> > 
> > Sorry for adding another email. I got locked out of the first one for 30
> > days...
> > 
> > v2: Corrected syntax errors in compatible:
> > 	xlnx,axis-fifo-mm-s-4.1 -> xlnx,axi-fifo-mm-s-4.1
> > 	xlnx,axis-fifo-mm-s-4.2 -> xlnx,axi-fifo-mm-s-4.2
> > 	xlnx,axis-fifo-mm-s-4.3 -> xlnx,axi-fifo-mm-s-4.3
> > 
> >  .../axis-fifo/xlnx,axi-fifo-mm-s.yaml         | 257 ++++++++++++++++++
> >  1 file changed, 257 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
> 
> staging drivers need to be stand-alone, in the drivers/staging/
> directory, please keep these files there.
> 
> thanks,
> 
> greg k-h

Does this mean that the staging drivers do not need a devicetree? Should I just
drop this patch entirely?

Thank you,

Daniel M

Sent using hkml (https://github.com/sjp38/hackermail)
