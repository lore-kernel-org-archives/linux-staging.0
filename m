Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB12341660
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304806; cv=none; b=BGBq/ORAtOYoIUC325ZA+rU6xJnGncFraVOa9gGTydiZB7Q4UWQJFcgqSzDP2tIIRQKaQ9a0JxXSX3p7wiGmnbKzMqk5ajsep+eYT9zcZOXdq0g5w7I1/PaLAwT8RCHuGMaVFRcjg46NhS0Mfq4cZJm1XtOF2AUgfW7O3m0a+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304806; c=relaxed/simple;
	bh=v+DU3O2euXF1l4XaVKPADlgmTc7yhQIf/A7MBRgox+A=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=pFJSMRqhMBm9PNrn1DOMbQX7StpfxeI8xnfIMh1+eYtxnmqKHbsPNF05SUlR2UMn2J5wFWuP1hqT7Ew7NI7w3Uh2pOhWwJQKxI4kfvU2T5VrNjzunFFPL2I1AvyFpahMnhvtUbFCvE4kbVWjXqQmcHbwgaSxUKKj/sCUX4i6qSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=x4xZi3BG; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="x4xZi3BG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 5159884E66;
	Mon, 27 Apr 2026 18:46:35 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777304796;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lnh2UhsAln2MiMPcc8hmGC0TEFz3VGeiLYXL/UReIno=;
	b=x4xZi3BGitzRNFz92zdmChdWVgcyXKqOSFcNKvaszTi7BPC74nsoah5MipVD7Wjsk53tbC
	RoiRotB1fhH6IK0AtXrpfAc96H29X11/utDM0rhBmhjqvzATCGo625MM3d+GLFAV6A7qzw
	qVCFfBTupO3tP5/GSVkRSE160a7MjkHbQpdkHZ+NTKyj+XTBU56H9RUG098NfFrsDxftcM
	4eJyYyXiszAT6uFm04F+GNDywAxPdR16F7F8ap7cNUBg8W3tQEvE87g8tDJerfV0sqWb0g
	KsJCABu63vO/W9tPvUGfv04n0Zd2YXgLvVJ/Im1FMZQqXaXCpCydnQKFSRcxBOT90bpt0r
	PYaeNOTk48hGjsh8KqfL24KkHxL/hIpxC3FPa45WfuFyqEDtFrvmaWqkMUMt69K2+jTV6m
	Hy8VshLayA+TS69znGqhpYrTswMZiDrYNZCae/lCRWJHLJfrAwdVdZlBtqDj1o4/wnJb9Z
	vKAXEdNSU7RdmDNR60x83Sxr2+OsS/tEnPQRkNQIUwvgoGqNyE8JufLtfySEu1pCaAU8i2
	XWhO3sleDq0ukl4WANRPjfDFZ14ITHfmKTiqwn2gEV5C/Kd8WkC4t+sLfvw2MCFxmgQS+b
	R6XTfWUAkdH4HIkN0OL4Z3ACr/lq/cPBfuNjseGoiQLlcZdB04Tdk=
From: "Salman Alghamdi" <me@cipherat.com>
In-Reply-To: <ae8oIMM08ntVQFdO@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
References: <20260426225552.87114-1-me@cipherat.com>
 <20260426225552.87114-3-me@cipherat.com> <ae8oIMM08ntVQFdO@stanley.mountain>
Date: Mon, 27 Apr 2026 18:46:34 +0300
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
To: "Dan Carpenter" <error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <5d82ba44-eba0-0d0d-4cdf-fe58a3e6cb75@cipherat.com>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 2/5] =?utf-8?q?staging=3A?=
 =?utf-8?q?_rtl8723bs=3A?==?utf-8?q?_rtw=5Fmlme=3A?= fix lines exceeding 100 
 columns
User-Agent: SOGoMail 5.12.5
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

On April 27, 2026 12:10 +03, Dan Carpenter <error27@gmail.com> wrote:

> This patch is too big and too complicated.  If you send a patch that
> only adds newlines, then I have automated ways to review that but
> when you're adding variables and change code to use min=5Ft() then
> it's hard to review.

The introduction of some variables was made in order to fix line
length for certain function calls that has long named parameters.
Should I separate long line fixes into two patches, one only for
simple newlines and the other that introduces variables?

> When you start doing things which are more complicated than
> just adding newlines, then it gets controversial in ways you
> don't expect.  For example, we don't really use min=5Ft() these
> days.

I tried using min() first as Luka noted me, but checkpatch.pl warned
to replace it with min=5Ft() instead. What is the preferred function
to use in this case?

Regards,
Salman Alghamdi

