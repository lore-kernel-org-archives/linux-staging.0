Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1708D361DB6
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773868037; cv=none; b=epVXhKGF0cQxJaCx3r6lV1XV7aG8GamRJmzs964Wm05QtxfA67zxFKhWyFgY5meWcDFdZFb0m8+RsCx2Xis78d4I0HhnGYEmwEHWElYjUNo801nQN4trYg5EJzQFbjtrKsYEsw5WXCJBmmGoSMGB5Pcw1+HCRiQm4C5FKuJ3zFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773868037; c=relaxed/simple;
	bh=5blidZ38hSc2g2MnlYws3YrFYuUGtNaoZI7Bn/1vyR8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=J32UJupabvu7Fa8u/q8/oCjYPLuxEXVS3Wxqtw09I5JT7Mx6P7IJs8CiFIcJBKLwWQ/g8/BHJWP8y1MYdn1acWjDXERvhRtjNWbw9p+ifJdAwS5zH67YvbcNkOR/lrAK5UD/WCri0ppeCh7KuYn7XxtWdGNeOo+llk7R0QAT25w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wlyp0b2/; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wlyp0b2/"
Date: Wed, 18 Mar 2026 22:06:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773868032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQK39Mny5kg8QapuFwlMzVzVUBSMQsg8RrV2eQHf8u8=;
	b=wlyp0b2/sf5pGQvAWGzaxsqOR8/Lqxcob499qZtFSQmqZBz9LHOOMIZfpRyHc3Kli6063W
	QEaC4lScWaeH7N8FM2Nu3g0M0S6aSxibWN5vA05+dafhiQeS3pihk1IdNHqucKNGM8jjUZ
	PsjCEyQKrei4nS6WUezDGAbbIaDKLiY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>
CC: Aadarsh 7001 <aadarshmandal9354@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, Ethan Tidmore <ethantidmore06@gmail.com>,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_fixed_?=
 =?US-ASCII?Q?the_trailing_whitespaces/commented_code?=
In-Reply-To: <2026031800-tank-shakiness-3d58@gregkh>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com> <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev> <2026031841-turban-sludge-c8c8@gregkh> <CANQQrNO0GzqhYLj7DauWAoO=tVCz=86YaSjWWjAf-ER+UKmK6Q@mail.gmail.com> <2026031814-unskilled-scrambler-3372@gregkh> <DH63N4L7EAPC.2TAFLF2BQK8K5@gmail.com> <2026031800-tank-shakiness-3d58@gregkh>
Message-ID: <D3463B51-C2C5-4A9E-A7CA-5A3627AB04F8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On March 18, 2026 7:17:44 PM GMT+01:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Wed, Mar 18, 2026 at 12:54:38PM -0500, Ethan Tidmore wrote:
>> On Wed Mar 18, 2026 at 10:11 AM CDT, Greg KH wrote:
>> > On Wed, Mar 18, 2026 at 08:36:21PM +0530, Aadarsh 7001 wrote:
>> >> On Wed, Mar 18, 2026 at 5:09=E2=80=AFPM Greg KH <gregkh@linuxfoundat=
ion=2Eorg> wrote:
>> >>=20
>> >> > On Wed, Mar 18, 2026 at 07:59:28AM +0100, Luka Gejak wrote:
>> >> > > Hi Aadarsh,
>> >> > >
>> >> > > Thanks for submitting this patch, and good luck with your GSoC
>> >> > application!
>> >> >
>> >> > Wait, what?  Is GSoC doing staging patches for "entrance" into the
>> >> > program?  If so, SOMEONE needs to tell me this, otherwise I will h=
ave to
>> >> > treat all of these as an abuse of the community review process and=
 just
>> >> > flat out reject all staging patches until the GSoC application pro=
cess
>> >> > is over=2E
>> >> >
>> >> This isn't ok, you all know better than to do this=2E
>> >> >
>> >> > Who is in charge of the kernel GSoC project this year?
>> >> >
>> >> > greg k-h
>> >>=20
>> >> Sorry for the confusion, that wasn't my intention to abuse the commu=
nity
>> >> > review process=2E This is my effort to learn and contribute to the=
 kernel=2E
>> >> > I'll be extra care ful on this=2E Thank you for clarification=2E
>> >
>> > If you are applying for GSoC, this is not your fault=2E  I want to kn=
ow
>> > who the mentors that asked you to send this patch, where is that
>> > documented?
>> >
>> > thanks,
>> >
>> > greg k-h
>>=20
>> It's on the actual page for it [1]:
>>=20
>> Create a small patch that fixes a trivial issue in drivers/staging=2E=
=20
>> See points 1) and 2) below to learn the process=2E Only after this patc=
h=20
>> is accepted by the community you can go and work on the next step=2E
>>=20
>> Thanks,
>>=20
>> ET
>>=20
>> [1] https://github=2Ecom/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-202=
6-Device-Tree-Bindings
>
>And it points to a video of mine from 16 years ago
>
>{sigh}
>
>It would have been nice for someone from that project to give me the
>heads-up that we would be getting a huge increase in our review load :(

Hey Greg,=20
Due to an unfortunate situation of current GSoC and an increase in=20
review load, I am able to assist with patch reviews if you want=2E
Best regards,
Luka Gejak
