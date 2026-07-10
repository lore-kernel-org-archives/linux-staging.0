Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7476426D18
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695055; cv=none; b=JKhNIX+R3jd0xgVoRUUOk3Aokqauwwk2soRz1nmdVqDUTKb3Gywpf4gfdVoZOx04tb69pukFVqEy+vaLgZCDEFJ+bFyThnwBilVM445f2TuAyRPW2LMvL7yc1szfdBPyd2aGDYFaLr9cTTs2jnTbhXo/EyYL+CNSASEyDlg4BrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695055; c=relaxed/simple;
	bh=HdWQCDvo6bp9DkOMdbojww48CjcP1CUpBsbcbtVNAq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK0P7Wu7FdRaL1DUOS2WnZ7JeMT6WUU44f9auL5QFxy5l6Jfg8WYlaIyMBhLrzScmdtSZnT9YBQNuFmnqTXLm7d9fYmFj/UXJDNvs2s7LnR28uX0Tp6gcS2eX6gKcM39zeuzSItHlxyBYP/iaIfRsEG47ZuRE2ew0JDCWfb8tH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YuTFjvo4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YuTFjvo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593A91F000E9;
	Fri, 10 Jul 2026 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783695050;
	bh=cdogx37YR0oHtpanz9s/hDee2ihsBSkr7lTdMsgknPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YuTFjvo40EXB8GzAEtzJymTODHD6uMtmRd40mpJvwQ0zdMXAa43fMsG4PnO3yAN+2
	 c9pzL+MACUBF0uYAA4YIhNl274eio0Qu6mOqR32tQSKvCs+a0/MRzu0vvA0KeeK1l3
	 m9VCyNYans0L+UQPopMhk5d6F1URSiBwrLduyPIY=
Date: Fri, 10 Jul 2026 16:50:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/9] staging: rtl8723bs: remove some fields from the
Message-ID: <2026071034-zen-staff-a5db@gregkh>
References: <20260709182627.16327-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709182627.16327-1-nikolayof23@gmail.com>

On Thu, Jul 09, 2026 at 09:15:07PM +0300, Nikolay Kulikov wrote:
> This series removes several unused fields from the struct hal_com_data.
> These fields either simply take up space or set but never subsequently
> used.

With this series applied, the build breaks:

drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c: In function ‘Hal_ReadPowerValueFromPROM_8723B’:
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:1185:30: error: unused variable ‘pHalData’ [-Werror=unused-variable]
 1185 |         struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
      |                              ^~~~~~~~
cc1: all warnings being treated as errors


