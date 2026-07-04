Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA19277C9E;
	Sat,  4 Jul 2026 06:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783147331; cv=none; b=I6QQLpo6GyTu7ikkdia7DC+n6f3+TuOpZx4od3QdAYgqeDs1lxRTr3KPvXVhF6E/DQeHbF7X6s4X18LePZKbH4gLvef0Mur+g7xVZo5TRlKYewbrklDVdfU0SHv6X9068s0zIe8nG2syedlvC3Wi2VMIlTUdNE106NL6ZGwLsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783147331; c=relaxed/simple;
	bh=BcXw42o3d1jirfAYtegfe4mNqRu5k5dfUohcUOdl0rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZLY9S5tE1PQTjRDogsjbwOVkveROdDiuGyoeNi3MIzDistab+njWTBqVJBrIyONoDyOZ0OSE18NoJs97VD3DDVuMX6jpVBKaJXGrbjZ+iXymcFIP5Or8z4Ilh3dL+oXlqvnNXEicMTL8usUwJh9PqPkAuIVu8YkXvPt8n067rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PW96HqOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PW96HqOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C6E1F000E9;
	Sat,  4 Jul 2026 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783147329;
	bh=JBzDQl4ON7Afy/duWCxyWxe/gupxaZRaZ52l1SMm9XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PW96HqOiTkcDNdMnPdwnOMYE2oIp4eyQlNm2PHLPt11hMnFkhuY5oJPyKpixUKA2M
	 qI5qw1zWKKmwMuqrz7rUSeHxsFo4Iq9q0+yEplGpocFHk0whot8RfaVYulbq2sozS/
	 AFauhvGvk/K0HtekNIXXc4XbCeGbUESfDLMmhCvs=
Date: Sat, 4 Jul 2026 08:40:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Freeman Yuan <freemanyuan15@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix cmdThread CamelCase style warning
Message-ID: <2026070441-calibrate-sterility-af03@gregkh>
References: <20260704034152.115006-1-freemanyuan15@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704034152.115006-1-freemanyuan15@gmail.com>

On Fri, Jul 03, 2026 at 08:41:52PM -0700, Freeman Yuan wrote:
> Rename the CamelCase variable structure member cmdThread to cmd_thread
> inside drv_types.h and rtw_cmd.c to align with standard Linux kernel
> coding style guidelines.
> From: Freeman Yuan <freemanyuan15@gmail.com>
> Subject: [PATCH] staging: rtl8723bs: fix cmdThread CamelCase style warning
> 
> Rename the CamelCase variable structure member cmdThread to cmd_thread
> inside drv_types.h and rtw_cmd.c to align with standard Linux kernel
> coding style guidelines.
> 
> Signed-off-by: Your Real Name <freemanyuan15@gmail.com>

Interesting name :)
