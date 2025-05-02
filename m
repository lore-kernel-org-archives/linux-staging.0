Received: from mail.ana.ir (mail.ana.ir [94.182.146.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC1C22DFAA
	for <linux-staging@lists.linux.dev>; Fri,  2 May 2025 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.182.146.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178603; cv=none; b=En7XKLGhZcFkOKbSiMcWlwMvlhVi5YglPvVbufgzhSdh9KFaMggbr5q+Tn+tV8vEUz2WR2aexqu4lk0JLkGpRtJ6auKJnt1ieLl8Eou+a57pwTX0MbgrYWHK52/852AgRtJBOHoNVEC7IKjHS25gFBXMD+UqBX27vOyYBpkWBDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178603; c=relaxed/simple;
	bh=3aE1fd0kQeuW8iPvZCpostA5mkJ1QKX4YBBon8sngyc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=glRJd+cV207KAqXvI6iM/YiISnDt9Fjl+vWDPYbCBG50hrmbmMQI6wsMqRGPS1JWt9xpxDgbrEKpv/DZdoqaSXGNHee4yauQtSYGgkl0U2Mcp+wYTuOtTjE+w2LBHycyUQxStddRK9xEeNMmzQbq7+0OaKjdNWsde3+pbEuQmz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etihadaviation.com; spf=fail smtp.mailfrom=etihadaviation.com; dkim=fail (0-bit key) header.d=etihadaviation.com header.i=@etihadaviation.com header.b=V7OrwSJu reason="key not found in DNS"; arc=none smtp.client-ip=94.182.146.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etihadaviation.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=etihadaviation.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=etihadaviation.com header.i=@etihadaviation.com header.b="V7OrwSJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etihadaviation.com;
	s=mail; t=1746174440; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=NZbp325f1KFvcVpk08EPj44FtVfz65+5i20x5nXXdpk=;
	b=V7OrwSJu3FNSD6Q4qq5QdNdwZqX3SWfEVvOyod2KBACVTA1DhaMyepmx8FN6e5EhzzPJ+K
	vEqRC34bAL47JASItToLoeFlJBimZxIDUOdsRmb5IhMkltAF2LWWnnVkDALXbHjv8UUQDU
	bturV8LhSiwVtg7fFoUZvTGhyQTvd8M=
Reply-To: vendorscontractor@serviceetihadaviationgroup.com
From: ETIHAD AVIATION GROUP<admin@etihadaviation.com>
To: linux-staging@lists.linux.dev
Subject: Vendor Registration 
Date: 02 May 2025 01:27:18 -0700
Message-ID: <20250501235730.BAD135E7788A32E8@etihadaviation.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Authentication-Results: mail.ana.ir;
	auth=pass smtp.auth=info@ana.ir smtp.mailfrom=admin@etihadaviation.com
X-Spam: Yes

Attn: Sir/Madam,

Greetings from Etihad Aviation Group, UAE.

We are happy to contact your company and also extend our=20
invitation to your esteemed company to Vendor/Contractor=20
Partnership registration with Etihad Aviation Group, UAE=20
2025/2026 projects. If you have intention to participate in the=20
process, please confirm your interest by asking for Vendor=20
Questionnaire and EOI.

We appreciate your interest in this invitation, and look forward=20
to your early response.

Best Regards,

Mr. Ben Stokes  ,
Contractors Coordinator
Group Procurement & Contracts Shared Services Center
Etihad Aviation Group PJSC
New Airport Road,
Khalifa City.
P O Box 35566.
Abu Dhabi, UAE
Email:  vendorscontractor@serviceetihadaviationgroup.com


