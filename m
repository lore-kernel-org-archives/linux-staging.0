Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03343DA20
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093956; cv=none; b=KGYql8xcqF2bZbbDzDTRLeQH9EU38WofZPjVsg9RTomrdnq8ppECMoSRtOknT66P1SWds1o8J3CNsx9U23Bb1JTPkSxxfZacB7vAlyPAK7yRrK9tCCtGCberFahPnKwqFoEAguT8K8jj7rnQIyeT38Td9KQ2d7GE1DdZH9XFFpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093956; c=relaxed/simple;
	bh=MqKN/CyXnBvEKRa6clswxFGseTzXpp45r4fPRwkp/jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1mF32EqzO1eXhNWG0HknA+Q5Yp7JRaFlmxplaiZX5M4itAgP+G9cbwbt2/p3OMFKXTe9k7eABFIh6m6XZRZzCbE/RShumdtirqEcW/SV09hPBQR+P25j3y1O4ExxnkGByuiYUCNuxIfpkFOCGf3s8n58AHZyYUREbZWyknlSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2QWiVwA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2QWiVwA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso3878135e9.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093954; x=1792698754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbKrV9ZS+HqAjoNdBqIayYDFqYJtJKhvPtbhxsnDTLc=;
        b=m2QWiVwAZx4VPF0tRSrVUA+bGXlTAARflTc7uKe+CLdjxT5WyDwoWa04zWHfUVwkmm
         Z1BdDn4jL6UH+lGeJu7tF2zs+8oLuUqzJXHU3nsPfetrYdqGc2DAMchwUQMPgF9pvXpj
         mXzRoKs/E9jJEFXRnwWBAw2Wv+ZPaTy8228bCHis8GawxLxg1WkAnzsmhn/MR9nRs5ke
         ghVYtehVYiRgHa8xTFeYld9gk4dUWuomktS+vofwaTe6POqNQYMRZsS3M6rllL+aqGCn
         NpmDdcKGhx24ZAeClqp5uuym5fv15gW5JYiqW5W4RiZdUSE7EQiCXjVNKX+KoWVD3fwb
         h7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093954; x=1792698754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbKrV9ZS+HqAjoNdBqIayYDFqYJtJKhvPtbhxsnDTLc=;
        b=0XtBa8SGEiovE7Ji8zWgedrzizy1qoB/+deyaC64RkroT3c6B6dtU8FwpAceZCEdf7
         LAgcwoigJOdoNMgpLtSBCraJhV/TkOeCQx8GgLTu53OJvSYDvhTJv75Ffd0s+XSHRbrm
         XSBMgJf24w9fNcthQdgQhr/LbnEITvOgQp8dkU44HAN/+FHiA2mcdSTBC0+c3r6xE1c7
         AeDMXape7mwiO2de8c0suIGyse5NSfUUyxZnQ81fTKNMD3QwZplOS57R3pCBOq20tvXI
         jmhVcAW+ELV70pq59++L4EtY6oSK8BpfwpHwRnxKZagaSJ9CqV/tADyc3XUiDaOqEi2F
         Dnug==
X-Forwarded-Encrypted: i=1; AKwUvBxms26gWSAQam45RJMp/4o5nP4ZjdZXGsCcMzEfdSlVcvAFCJ3DLUBmw64/ILkCsMsydTD/3k3jznvgEtMP@lists.linux.dev
X-Gm-Message-State: AFq9FYJwAWLlrYaeUbmI5Ts+0hAfTvwtGE0g10Xs8Id6NFcx9/1oAkXU
	5Ao678jd+WIkICyzhXYOXAyepLNAIE5XcpaaCItlL3+jQ98nH4ymtPBo
X-Gm-Gg: AYBFou2NV3bvZBczFiNXBp4hrJ4EgfyoPqqmvwPipjqL/lTZl2hFCjeyZNc//qkgriH
	eK/JTbLcmgyhEcFqAISWZ5ocUuDHpRis3LsUU7Q8VrhDcDLsH3H4ts4llBFtu8Xu0lpCLrBiW/0
	5GqnIYaurz19og5WokB73PrPMQ7zF784QXzkcpKG+w6SMIs/gHpsa4vPoVsL3jvCPP7wk3YoUIU
	jvkDSRBrcG4Q7NNILh+3g4G4jsH2RDeIQlATZFCtZ6dzURi8e9uZ+TCv2IE8GhxHPrl+mltgc//
	mS/w67BKsausmzgtpWvjVwyVMgVyUUnN54QWAuDlJJTg4WG2JZFef6XbudMRHD5/PsrWohyq124
	+YTfsL5Yz9peiXrLZqyH3vpbikq/RxEPlXU+EXpokEcD0ZLhNjOAbvX75Dllvu4Zw5kWgeupNIx
	caiT3406gGLK4vAzM6SaWM3i8xs4qPxK5fn1fXeanfH1Qaz8oJZVIdlTB1yvDkdE6VQ68=
X-Received: by 2002:a05:600c:c0d4:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a1c664db70mr23088045e9.6.1792093953504;
        Thu, 15 Oct 2026 12:52:33 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm6156275e9.0.2026.10.15.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:52:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:52:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, pavankumaryalagada@gmail.com,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	dennylin0707@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atEu_ZAyNVxyfbMr@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <5f06793dbe846865b7d86f656d27caa1c65732b5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f06793dbe846865b7d86f656d27caa1c65732b5@linux.dev>

Ah.  In staging, patches are merged on a first come first serve basis
so you are free to ignore any patches which are sent after you sent your
deletion patch.  Obviously we're not going to merge fixups to a driver
which has been deleted.  If there are patches in the list that were sent
earlier and haven't been reviewed then reply to those.

The rule here is that it's a good idea to search lore before sending
a patch.
https://lore.kernel.org/all/?q=rtw_generate_ie

regards,
dan carpenter
