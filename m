Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070636A36A
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481889; cv=none; b=rOO2xoITRciMwAfljaV9bE19rF/m+psFfUptkSYqWff2eRM5YU4eFjHPjY8xQzCcIa9UD7nF6Gt74pauvZkEub9zyVuNCOMVhEiT/Rzk6czFBRWfiqrGAqefXeZwOIb8vwLGOAwwnEU5iXr0/elmPckzVbThDqTzPHgr09iAhRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481889; c=relaxed/simple;
	bh=kiBRm5/4pxVAwBOt0P3I9tFCOdLhrJuqa/cW8h+RSkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nsu28ElsMOFmgZObbvHfN27Rop1b5I8qHf99pXNGuNhVtn3CGsYjyb7VBH71ps4JobKWHIkidUL3ry02KwmAiOwQwUXuthS2LsYnmaPEdmJ7tevn/dR56B/KB9sB9CegqIehRKvePE1UfDPW4O/jCxzktPi9O5D+yrgdT1PFgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cur5oaOs; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cur5oaOs"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso670039666b.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780481887; x=1781086687; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yen9suyhWLFEqClFgAm2QyMXxENqYy9fHBy3tZ7QTms=;
        b=Cur5oaOsCsxPnkQU98VNDhGzSyHbWbV5Ylvmbm7wd8AThJIgBWDhPHbG+Dq7U/pdkK
         UGhTxwBlK+LOom2CLHx9MdHrwVuVHBX00mgRr+d10NgNORsU2S7xSOv9TkWJt+o1xu/I
         l9GPxuk4ct+BRcCYUyfvCWfJu9zna7JHSJ05WEpQk0Js5+cwtCdC9DEWO1AUaQQJ1aHN
         xvgQIwm08FiZYBHx0BFCoTFrP3IEKvmRR7CQ/ZB50LpmnvYpqN4ewbFrpoM4sA1JA8eo
         9yxsSsgjyKdba/2t07R1cdACloHucpxdydW5kZm7gxvNvK/wNobNUbuENzc47KhEcyY8
         43NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481887; x=1781086687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yen9suyhWLFEqClFgAm2QyMXxENqYy9fHBy3tZ7QTms=;
        b=jOaMZm6JNoodRHfVA0vYigNfm0aXWih/tABUV7lciW4Nd/yfDPH9DNZs3v0CRLFZWc
         JkKNUevUL+jz2k7nDBA9CDxOS2AUrqzyyhGPZOujN5Kj8R297VMJcBtjMWoTUc6p2R9G
         p55SuXE6+SRU1ZK58NHwCbNF0yqFoNjELxWilhEnE9qajgXoRVfXOhJxfrqTaK7O/+9h
         Swd3HqYucOqjgyr9NWGJaXcUdLjdGahzhxX18vh1sXHMfL1ndK/rqjRfrh7VWd0x5aST
         oPBfZJn1h848O6Zyc2HCtb5R8dyijtJtqD1Imn+p5Gn3T/ENCJ6nCTA5T+fPRcfBuGJE
         /Vsw==
X-Forwarded-Encrypted: i=1; AFNElJ8B1ej8+96iGmQK7haikjUy8HIk3CMkAaLZPSt7mCJ82B20JNPyoawQ134whcQebVvjw45sb8O8b+t+MhnH@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj3aDg4R16qJZWq9htDXLTzRC+dWTt1Zog5cY5xGKJ7EvPDtuQ
	cOq7D/rvtKo4TNfBv6SHUoCpkFNkJvUBiMSM7cYAL4/Wq4GVMmAUR5SO
X-Gm-Gg: Acq92OGFa6QuwOKDCNonQxlsWMaYrdDZUuH5DZNA/QOe2698c/YOLEZfNBQqvVMgQKo
	cO04rCbkiIzZTGNdujADM+j3CS4f0E2oV//KSi/I+Ml66Tpkz8rNmJWSvkn1D5cgXk0JohiZ9xa
	8io/XNSJNMUH+ziba5nV5JUG2l1qabR6GFghGXNYwBvQgjW1SFAWwD/3sLQm1qNJEjfQeLraCFr
	rphnkcGnEU9xNM1gVaLTa24DJOj46rMOrhPojdJVlCC8PVg6ljUsBnWpnUDqlDsk9gXrIe86W/t
	D9QRm6/b1feoo/OarMv1HxivWwiV85zMQuhGw56tqjt/3c51550pAcLnkgMM5y+kWJMae3EARHp
	voq+OdBMzeSVtlT7nv/BkojCNCXxIPwUOjlMyZdocqgAY3XGTl+kN34Fn7VZw01vdSjamdiXIxB
	tOBll1GCkV3VzLL4ae1EPtjkbKluAuDQ==
X-Received: by 2002:a17:907:cf87:b0:bdd:52ef:73e3 with SMTP id a640c23a62f3a-bf0a8d277c9mr142467566b.12.1780481886647;
        Wed, 03 Jun 2026 03:18:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1ac0sm125247266b.62.2026.06.03.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:18:05 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:18:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eugene Mavick <m@mavick.dev>
Cc: gregkh@linuxfoundation.org, khomenkov@mailbox.org,
	ethantidmore06@gmail.com, m.steinmoetzger@gmail.com,
	tomasz.unger@yahoo.pl, arthur.stupa@gmail.com, jannik@jrehkemper.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <ah__WsNOhrCWSLW2@stanley.mountain>
References: <20260531061022.573089-1-mavick4022@gmail.com>
 <20260603080105.780648-1-m@mavick.dev>
 <ah_pZPamB-HJhawR@stanley.mountain>
 <DIZB2839PXFV.3A5L73XAO2X67@mavick.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIZB2839PXFV.3A5L73XAO2X67@mavick.dev>

On Wed, Jun 03, 2026 at 05:26:46PM +0800, Eugene Mavick wrote:
> My previous reply can be disregarded, I realise a few of the parantheses
> removals are still present in the v3. I will correct those and send a
> v4.

Heh.  Yes.  And also the commit message says there are some.

regards,
dan carpenter
