Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4AA49A3B7
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379401; cv=none; b=Pr9GR00QZGOY+S0/GnsiVYxq3LqXbMx8AF2P1qcZzJE2sMWW6f68VlVPC+qVKelJLy/3vy0bVn0sxzG1JQEEc7O8jJ5txlUZYPdnI4M6KnNH+BpZLkpqGsPIlqkS1qrAiIQziO0TwEXQcLYM+AnIJb1dW7qsAthbdJXqhc+lgKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379401; c=relaxed/simple;
	bh=rJMppgT9oJ3b/b9uCe7KYV8NZEdhB6dmkkmBGtrxXCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9UGp3PgHDMvkOs1lVFu2yBGdUiPgVdP0ingOYYVVNBXloA+F6yVIkuPrTFaElQpCEg9E+gUimp0IgB9J6CWRVOB0JO5/WUWFaIcXamanmqV9Vyz7rmzjinbxUYlxx41KcQwpVxrplE5AE7h7xXXUHtItI1HALl671Ua54NCGqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=ddkzEkQB; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ddkzEkQB"
Received: from localhost.localdomain (unknown [52.172.102.219])
	by linux.microsoft.com (Postfix) with ESMTPSA id B884C20B7166;
	Wed,  7 Oct 2026 06:21:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B884C20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791379326;
	bh=rJMppgT9oJ3b/b9uCe7KYV8NZEdhB6dmkkmBGtrxXCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ddkzEkQBmRndIGN+wp6wHJZ0gskRjt9v3xiSKpU/Fy9JxlR+C3MmlvRh2o2drRtI+
	 rBXY9nU71w43Sy0jrW3QWkFMNTO9ALpD5VZ5iFmEYcIeXfcacFa4v/enz7vNJaLRI+
	 C9ErtBCcYH7Zg6PoKxtk6H6iFcoyewvcy8LlfdI8=
From: Cen Zhang <cenzhang@linux.microsoft.com>
To: luka.gejak@linux.dev
Cc: cenzhang@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	guojy.bj@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	linus.probert@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mokshpanicker.7@gmail.com,
	qstrydom0@gmail.com,
	rayfraytech@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: hal: fix a multi-line comment in hal_btcoex.c
Date: Wed,  7 Oct 2026 09:22:44 -0400
Message-ID: <20261007132244.66777-1-cenzhang@linux.microsoft.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d2f64843fa25fe259109aa19b1592d82745e40b9@linux.dev>
References: <d2f64843fa25fe259109aa19b1592d82745e40b9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

Thanks for letting me know. I will drop this patch.

Best regards,
Cen
