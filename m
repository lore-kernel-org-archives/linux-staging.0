Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311D237F8C4
	for <linux-staging@lists.linux.dev>; Sat, 29 Aug 2026 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016949; cv=none; b=bGC9eRFk0dG/QOej89TZVQL9rqOMuEZ6Hkmvh9aoUNrJGopyVxd+TIg0vTh/jVmI91pXQqeH2xFjaGwazQfo5AERutkk7QMIPQEBIE/aZuBvqtjdZ8eEbehdE25FX3bxt5qpzzX49aYZTSwx6Jtv01jgpzzgMpVI0DVwclCPtD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016949; c=relaxed/simple;
	bh=NOgOZlUaM/P473Dt/4oHR5EYD3Awq+JCy67VWmWka1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4JlxwZFhyD+nCB1t7rrSek+rh/oboI8sQ+6/QQ0UiSfzPakSyjaDl9N5YWIZay46S1bOP9DAjMvl6n/R2ldBBc+TnnI5TDQtZup6lIPxuF0GKxeNybUbOfy7PhO+jr8gM0D0aA0/WNvvNMba5k2DSjz/C0rwUynFTG5qj6pfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tbh1dToC; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tbh1dToC"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3050982a91.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Aug 2026 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788016947; x=1788621747; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZLJvRZdayHOtyOM9Jv6yNvITLKiJ6K0DLdKhkNStuI=;
        b=Tbh1dToCwcsml4qz7Znj/ECThr8b1rsl3VuBRgjsgO+4KA08KDZxB57eh3fE3gg+c3
         NkcsZAYXdj5YTMzvCDScFepbv25DiQKkvGcTRy6FAJyhyFThiJ+qrfFwnE2WK4+piNNO
         88h7MnprIMbko5ztJ1sYgHCFmKpJvtWMVshQIvrTtanRXQdr5t9eJ7Q+mEKMKg3uH7NG
         d1AbYeycjmonUaY8Daz1uay7eMNXnuzor4S/hYYXVGTwTOCyefKBhiELcVY42gDbejQg
         jnB9uKmcErwqdUY/QcdUWz6dQ5N4vtzrz47cCqOHEnvwQLg/6dJcaWt3i62F/TjOPjaQ
         k7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016947; x=1788621747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZLJvRZdayHOtyOM9Jv6yNvITLKiJ6K0DLdKhkNStuI=;
        b=MTcK+PR7QdrXHrXZSoO0ErMG7A2ljojsKBdqmMrGVnyyjN+iO27Vn/NW85ITLo+LSU
         sPXH88aFOP2Pb3+sRyoBKDOx3C8f5AArSuyRGd0B1cgRs0HqihjUQypd8M1HZZsiKDc1
         rYC1M6QHnfSXtEaRyyic/qMqiQSg3lV0FeYe+y/B2Zzl++oPyYn5HikEzGIRRSa9lL9k
         Cyxmt/ie2Vt1C80gW4mGJiNxUZ3irt0m1toEjT4E1OpI90dqdzan1mJMLiFOKcp8aZq7
         zs+5BeSp9VHscehvplovvwpnf241fwy+DAbW3cex38DcVS+TM2Tfd9YceEdH7X/6L2VO
         PvJA==
X-Gm-Message-State: AFuF++ljsIO7s1zFLBo0cz0M8X/93a8j36xAI6onVauvtH/Ltpy3ikXH
	9DvDEtTZ3OUK+Un/3LAsGca8vDhdOErGWpEzocdKpV55Zdc6iKxf2c5P
X-Gm-Gg: AYBFou20Cta90qSWXVKQdRwgX6HnvtlSVdOxnYs3BEPykzfZCaL43hLGpHRFfqoxTvh
	as29P7wdKH5otcbsZvHzi8W+vmzJm9YFVIsFNEBrBD0oObzF8v+DVCdsoomRn1hTSnenQCHDbdF
	ZT+EJ29YSl9SDrTyMyh0+Bo1LBAulg1tboZz+WzJDiVe/cG77zlMXdCRuVOuTuqH4IGKL1AE0oi
	Ev50WoyMEL/RlMMDrZHB67Has4AFtpnZrQnEvO5iUHxfB37/y1VcIiiSFCN3SQwtYhXZvjWgm6j
	uGKbtHD2GiEKG/mJwS4/cvyupe/t4uj7av1Q1XGdUeTgmWhlIS5hwyXocQxAzeJsm2Snll+QG6I
	KlxOaNixj0qJv3I6AbaVtFC3HZdaWPTYW716BuKbvW9JIJ6+jByM7fUg0LTBxMkXmN0eCFeh7oD
	C6YXyFfVB14/pjYxPAIL/6f0YMhzE3NzyIB+6/jjTAq/tnyvdCSN+yJAXhP+yvckEaU+Lx6hc1d
	Gmr
X-Received: by 2002:a17:90a:e708:b0:398:9bd4:d17 with SMTP id 98e67ed59e1d1-3989bd40d98mr11033731a91.22.1788016947352;
        Sat, 29 Aug 2026 08:22:27 -0700 (PDT)
Received: from localhost ([183.82.161.179])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-142e0d2e465sm23599024c88.4.2026.08.29.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:22:26 -0700 (PDT)
Date: Sat, 29 Aug 2026 20:52:24 +0530
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nikolayof23@gmail.com, lkp@intel.com
Subject: Re: [PATCH v4] staging: rtl8723bs: refactor traffic_stat access in
 collect_traffic_statistics
Message-ID: <apLzDlcfiu9NJUwc@Debian.myguest.virtualbox.org>
References: <20260803180549.20859-1-seedandsyntax@gmail.com>
 <20260807150940.5066-1-seedandsyntax@gmail.com>
 <2026082546-treble-delivery-49dc@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082546-treble-delivery-49dc@gregkh>

On 26/08/25 05:43PM, Greg KH wrote:
> Where is the 1-3 version info?
> 
> And the "Closes:" isn't correct, 0-day was responding to previous errors
> you made in other versions of this series, not the original code.
> THere's nothing wrong with the original code that needs to be "Closed".
> 
> thanks,
> 
> greg k-h

I see, thanks for the feedback. I will prepare v5 with a complete
changelog covering v1 to v5, and I will remove the Reported-by and
Closes tags for the reasons stated: those errors were introduced from my own
earlier patch versions. I'll send v5 shortly.

Regards,
Mirza Ishan Beg 

