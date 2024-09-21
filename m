Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7716DED5
	for <linux-staging@lists.linux.dev>; Sat, 21 Sep 2024 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726927813; cv=none; b=lsqUei3w+n5biMzVDSxNCbmwdz9W0WZHnqQpT0GnLy/azgFI+ycKnGZd7uHHxCsT4FaZIMLUKrigLPnu7zzkxRC+vdibbqDNWH8pBXSt1ZRWDJTks8bxVA29OFt5eDUOE2fDQdlE0TJ2ZWXcT15BfsldsDBpzdSiuw23lUGLDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726927813; c=relaxed/simple;
	bh=hnDiBGQpDXACiUc5CzaBwn1G+dXC9IgeleoQOKeOVq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k7/ML4SolKMpt2++IeXymdTOpsjwBCFJe84amu1f8cDxivoDdfCdMKzIWYIos7EW6rVw2h4B00Y8YkmecbU+6ibDsR67/Is13P65hkp0VllSy7ET23BEGSwAuwP3xlJHhhkDAwAHEeYTO5HStK1K6fuY1c6P4w4Hs3q3+5JF6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHASNs0C; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHASNs0C"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c50ea4419dso1384864a12.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Sep 2024 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726927811; x=1727532611; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Va2GHCSVvbFzqlLy4/Z3bbc+8WuiNPLRTpZiEC7ifO0=;
        b=aHASNs0Cv4Yx8VOz1+/fJkVqJIz2UPge0JwHsabKqfgYdxvTtoNbyfs52PnQ1Ag+3D
         Lm4zPhRhhTXKd4BLn6cAx52OoQhnDIJbfcQw7ruoNdWJAg03EenuLr7o4UPrVQwCVgBL
         5aW1KYvAUa+lBNpEDyv/QJbzarsf+PXSA4DesbdE7ED353AjU0v2ECt/PXInBct7GCkP
         V1fub4i8cVm87nXwokwpKC1tXwQhVFYsO1xtOPzx02f51aAWnjvHnMNiFyMAZFiJIsWa
         JRnnKki0saoEATfHQ0Odu4llAeIIGE4AR6WSuOt9g5Q+5A7KOZcYeoJpGYTlO18OD4Tn
         2Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726927811; x=1727532611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Va2GHCSVvbFzqlLy4/Z3bbc+8WuiNPLRTpZiEC7ifO0=;
        b=mU7zyAJYlnFO2OfE7Ei5b3i8ipUzZtqN2ePNRQKeiGf83MF3+cxmONa38d+NZ/bCSC
         UwrBqfdzLSmqE1IZXW7J/Up+I+HtW3O0JXRcM2j/30Knv9iznqoNTJMM9f9S9xlxeJpR
         gMeNq6/j0IGNBlCZAbuZ+ZkKNVXP0t6QM8DygzBn3HONtJAtGtH/qwme1UXhQXzt3V0c
         Cy63h6KZhXoo1MDvEnSY8YNvE7U9As/96hRNwcJMJsbXR/EILFrstfl4LeL1RCtX7bkZ
         r7skZLCCtc6yM39WaOY4w+d9KAARxUB1aMMmXTFariASSU5jOLSje87A1EM9cKLHicgc
         jbBg==
X-Forwarded-Encrypted: i=1; AJvYcCUvE4bHy3h3pzLTyiUVIDMO6xkf/m/pn10jLYy+kAX2j2pYIcWWud6fkjvI9XUG5fs2vdQZzwnUOAUz83Yu@lists.linux.dev
X-Gm-Message-State: AOJu0YyvYIVC3TCdm2UDJ442LhkeujkE+4UhTjNwyQMnknNMXUeF/DJ5
	UiwZb2t8PQiDTzyz8I90ItKlfmDlqD0CLjo+eEqWKXigGHMu8Ft9
X-Google-Smtp-Source: AGHT+IFb1M9LxkWZ2/EmDrefgELhOU6BduH8I8jNkpu0X+c9J4EoZTvBwXbskS6PuxHA5esCHJvoJQ==
X-Received: by 2002:a05:6402:1f8a:b0:5be:d7d8:49ad with SMTP id 4fb4d7f45d1cf-5c464dea3fcmr4858174a12.22.1726927810333;
        Sat, 21 Sep 2024 07:10:10 -0700 (PDT)
Received: from [192.168.2.100] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb94a0csm8328281a12.79.2024.09.21.07.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Sep 2024 07:10:10 -0700 (PDT)
Message-ID: <e7bfce0c-74a4-4c0a-9930-a3fe9d5ea5fb@gmail.com>
Date: Sat, 21 Sep 2024 16:10:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] staging: vt6655: Rename variable iTDUsed
To: Xingquan Liu <b1n@b1n.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240920162025.31465-1-b1n@b1n.io>
 <20240920162025.31465-2-b1n@b1n.io>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240920162025.31465-2-b1n@b1n.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/24 18:20, Xingquan Liu wrote:
> Rename variable iTDUsed to i_td_used to fix checkpatch warning
> Avoid CamelCase.


Hi Xingquan,

please do not take the first letter when it is "hungarian notation". On 
a first look it seems that the p is for pointer, i is for integer, a is 
for array.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
