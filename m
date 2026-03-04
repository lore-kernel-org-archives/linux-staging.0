Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088436AB68;
	Wed,  4 Mar 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630982; cv=none; b=ta7/w/7+ILtwwqmlwEwxtXUH24Tn08BM9TUOSXyDNp91XSWrBiEvcRXNIGlX9MN7g/smrHqIR+wt+PGuXBQfHQhixqrFqAASSKYqtT+kZgCubIe/Du8lEXnkbY66Xrmkz98cjHVj80/nUyzMWfSOxOx4gXgTMTypUwRnZADBCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630982; c=relaxed/simple;
	bh=7TNj6u9JUd2Wxq5G7tdyRw3RzmqcURmRrv5RgErMNhA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Ld1/s2P0OMRhgl4kcwupuvC+BwttIp+3Jg/zEROxr8P/nOqghkRUXfXHHOtbA4NS2ESBRIH8bjpqLfyzwyJDuhjYV+/I7UfcomnU0ENGBvYuiqLOcc9kWUbzIKiQlZEtz6Nom993qtE75xl9+OgEGnV0XL9QGPVbQVuV2sDWjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgsR6Vmj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgsR6Vmj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4CFC2BC87;
	Wed,  4 Mar 2026 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772630982;
	bh=7TNj6u9JUd2Wxq5G7tdyRw3RzmqcURmRrv5RgErMNhA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KgsR6Vmj2DU3cy4Mce9MZsiX0kDq9Uo/m99L1ix/18pK9zNLBpkaEbaFhz/8dZH/E
	 /edQoQUGT9IKCgTVhjYDNmSkuMs8eFLXDy2L/Puobibf6oq3YJJ3YlILIpq/0a68Lo
	 X7l6/c0B/OoaB4WFH5msDHyNv5LbrlpQ/k47cxM7wty3vw+jdQuWL0O5tLXavP0+n9
	 toe5Edy4S1TT2P7cVNuOzVdNP/xcdG9Jwp67/bCoN01UPlGGmgWfJb6vIYxjzZxjKZ
	 ub8xkDiCYJFPcG6F3FKx/LTzMeqvwg7tJjenLJHQGex2vK71kQ83Jch7PqG1HMfqDq
	 JZXpq3Lk+7jAA==
Date: Wed, 04 Mar 2026 13:29:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>,
 Alexandru Hossu <hossu.alexandru@gmail.com>
CC: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_dt-bindings=3A_misc=3A_xlnx=2Caxi-?=
 =?US-ASCII?Q?fifo-mm-s=3A_fix_interrupt-parent_property?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2026030429-kick-anemic-f48f@gregkh>
References: <e6f8db4d-2a5a-4424-b44d-6416ee0c5ca0@kernel.org> <20260304131610.37503-1-hossu.alexandru@gmail.com> <2026030429-kick-anemic-f48f@gregkh>
Message-ID: <6C6F8C62-19C5-48D8-9F80-47153B44DC6A@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4 March 2026 13:22:48 GMT, Greg KH <gregkh@linuxfoundation=2Eorg> wrote=
:
>On Wed, Mar 04, 2026 at 02:16:10PM +0100, Alexandru Hossu wrote:
>> Signed-off-by: Alexandru Hossu <hossu=2Ealexandru@gmail=2Ecom>
>
>For obvious reasons, we can't take patches without any changelog text,
>nor would you want us to=2E

This is also a second person working on this conversation=2E
I left commentary on the other version of it=2E
I am fairly confident that converting this binding is almost useless witho=
ut evaluating whether this should become a dma engine=2E
I'm almost certain my employer has something very similar, based on naming=
 and use case, and I saw no reason why it could not be a dma engine=2E
Any as-is conversation of this should, IMO, come with an evaluation of why=
 this is the correct way to model it=2E
I don't think it's suitable for any sort of "internship" program that sees=
 binding conversations as low hanging fruit=2E


